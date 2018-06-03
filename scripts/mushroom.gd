extends "enemy.gd"

onready var bullet = preload("res://bullets/redSolar.tscn")
onready var sample = get_node("sample")

const SPEED = 300
var RANGE = 300
var timer = 5
onready var player = get_node("../player")


func _ready():
	addRoutine("chase")
	addRoutine("die")

func chase():
	health = 3
	var tick = createTimer(0.4)
	var quiet = true
	while(true):
		RANGE += 10
		var pos = get_pos()
		var playerPos = player.get_pos()
		if ((playerPos - pos).length() < RANGE):
			angle = get_pos().angle_to_point(player.get_pos())
			velocity.x = -sin(angle) * SPEED
			velocity.y = -cos(angle) * SPEED
			if (quiet):
				sample.play("hello")
				velocity.z = 333
				quiet = false
		else:
			quiet = true
		yield(tick.r(),T)
		if (isDone()): return

func die():
	
	yield(get_tree(), "idle_frame")
	for i in range(4): shoot(bullet,(PI * 2) / 4 * i)
	sample.play("die")
	set_hidden(true)
	var tick = createTimer(0.5)
	yield(tick.r(),T)
	done()