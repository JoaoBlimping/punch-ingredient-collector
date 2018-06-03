extends "enemy.gd"

const SHOOT_TIME = 0.02
const EVENT_COOLDOWN = 0.5
const SPEED = 300

onready var bullet = preload("res://bullets/water.tscn")
onready var level = get_node("/root/level")
var eventTimer = EVENT_COOLDOWN
var timer = SHOOT_TIME

func _process(delta):
	eventTimer -= delta
	
	velocity.x = 0
	velocity.y = 0
	if (Input.is_action_pressed("ui_up")): velocity.y = -SPEED
	if (Input.is_action_pressed("ui_down")): velocity.y = SPEED
	if (Input.is_action_pressed("ui_left")): velocity.x = -SPEED
	if (Input.is_action_pressed("ui_right")): velocity.x = SPEED
	
	var mouse = get_global_mouse_pos()
	angle = get_pos().angle_to_point(mouse)
	
	if (Input.is_action_pressed("ui_accept")):
		timer -= delta
		if (timer <= 0):
			shoot(bullet,angle)
			timer = SHOOT_TIME


func hit(other):
	.hit(other)
	if (level.guid or eventTimer > 0 or other.collisionMask == 1): return
	eventTimer = EVENT_COOLDOWN
	var name = other.get_name()
	if (level.has_method(name)): level.call(name)

func fixCamera(bounds):
	var camera = get_node("camera")
	camera.set_limit(2,bounds.x)
	camera.set_limit(3,bounds.y)