extends "elevated.gd"

const BULLET_MASK = 2
export var speed = 600
export var bounce = 0.9
export var health = 3
var master = null

func _ready():
	collisionMask = COLLISION_TYPE.passive

func _process(delta):
	if (position.z < 1):
		health -= 1
		velocity.z *= -bounce
		if (health <= 0): queue_free()

func hit(other):
	pass