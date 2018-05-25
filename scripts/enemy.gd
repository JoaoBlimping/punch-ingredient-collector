extends "elevated.gd"

onready var GoodTimer = preload("res://scripts/GoodTimer.gd")

const T = "timeout"
var routines = []
var finished = false
var health = 1
export var hotHeight = 50

func _process(delta):
	if (finished):
		if (routines.size() > 1):
			routines.pop_front()
			call(routines.front())
			finished = false
		else:
			queue_free()

func addRoutine(name):
	if (routines.size() == 0): call(name)
	routines.push_back(name)

func shootFrom(bullet,origin,angle,pitch=0):
	var ib = bullet.instance()
	ib.position.x = origin.x
	ib.position.y = origin.y
	ib.position.z = origin.z + hotHeight
	ib.velocity.x = -sin(angle) * ib.speed * cos(pitch)
	ib.velocity.y = -cos(angle) * ib.speed * cos(pitch)
	ib.velocity.z = -sin(pitch) * ib.speed
	ib.master = self
	get_parent().add_child(ib)
	

func shoot(bullet,angle,pitch=0):
	shootFrom(bullet,position,angle,pitch)

func createTimer(time):
	var timer = GoodTimer.new()
	timer.set_wait_time(time)
	timer.start()
	add_child(timer)
	return timer

func isDone():
	if (health < 1):
		done()
		return true
	else: return false

func done():
	finished = true

func hit(other):
	if (other.collisionMask == 0):
		var delta = floorPos() - other.floorPos()
		var angle = delta.angle_to_point(Vector2())
		var distance = other.radius + radius * (-1 if other.flippy else 1) + 1
		position.x = other.position.x + sin(angle) * distance
		position.y = other.position.y + cos(angle) * distance
	elif(other.collisionMask == 1 and other.master != self):
		other.queue_free()
		health -= 1