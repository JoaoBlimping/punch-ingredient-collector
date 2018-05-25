extends "enemy.gd"

onready var bullet = preload("res://bullets/redSolar.tscn")

const SPEED = 300
var timer = 5
var angle = 0


func _ready():
	addRoutine("crab")

func crab():
	health = 10
	var tick = createTimer(5)
	while(true):
		if (isDone()): return
		yield(tick.r(),T)
		angle += 0.1
		timer = 3
		var origin = Vector3()
		origin.z = 2000
		origin.x = randi() % 1000
		origin.y = randi() % 1000
		
		for x in range(0,1000,50):
			for y in range(0,1000,50):
				if (abs(x - origin.x) <= 100 and abs(y - origin.y) <= 100): continue
				shootFrom(bullet,Vector3(x,y,origin.z + x + randi() % 700),0,-PI / 2)
	
		