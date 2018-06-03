extends "enemy.gd"

onready var bullet = preload("res://bullets/redSolar.tscn")

const SPEED = 300
const RANGE = 400
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
		var pos = get_pos()
		var playerPos = player.get_pos()
		if ((playerPos - pos).length() < RANGE):
			angle = get_pos().angle_to_point(player.get_pos())
			velocity.x = -sin(angle) * SPEED
			velocity.y = -cos(angle) * SPEED
			if (quiet):
				bang()
				velocity.z = 333
				quiet = false
		else:
			quiet = true
		yield(tick.r(),T)
		if (isDone()): return

func die():
	yield(get_tree(), "idle_frame")
	bang()
	done()


func bang():
	for i in range(8): shoot(bullet,(PI * 2) / 8 * i)