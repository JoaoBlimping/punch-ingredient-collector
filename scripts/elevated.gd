extends Sprite

const GRAVITY = 700
const Y_SCALE = 0.7

enum COLLISION_TYPE {active,passive}

var position = Vector3()
var velocity = Vector3()
var collisionMask = COLLISION_TYPE.active
export var floating = 0
export var radius = 0
export var height = 0
export var gravityMultiplier = 1.0
export var elevation = 0
export var flippy = false
export var collider = true

onready var shadowShape = preload("res://objects/shadow.tscn")
var shadow = null

func _ready():
	var texture = get_texture()
	if (radius == 0): radius = texture.get_width() / 2
	if (height == 0): height = texture.get_height() - radius
	
	if (position.length() == 0): posFromScreen(get_pos())
	position.z += elevation
	
	if (not flippy and collider):
		shadow = shadowShape.instance()
		add_child(shadow)
		shadow.set_scale(Vector2((radius * 2) / 48.0,(radius * 2 * Y_SCALE) / 48.0))
	
	set_process(true)


func _process(delta):
	# gravity
	velocity.z -= GRAVITY * gravityMultiplier * delta
	
	# move
	position += velocity * delta
	if (position.z < floating):
		position.z = floating
	
	# place sprite based on 3d position
	set_pos(Vector2(position.x,position.y * Y_SCALE - position.z))
	if (not flippy):
		set_z(position.y)
		if (collider):
			shadow.set_pos(Vector2(0,position.z))
			shadow.set_opacity(1 / (position.z * 0.001 + 1))


func isColliding(other):
	if (position.z + height >= other.position.z and other.position.z + other.height >= position.z):
		if (flippy or other.flippy): return (other.position - position).length() > abs(radius - other.radius)
		else: return (other.floorPos() - floorPos()).length() <= radius + other.radius
	else: return false

func hit(other):
	if (other.collisionMask == COLLISION_TYPE.passive):
		other.queue_free()

func floorPos():
	return Vector2(position.x,position.y)

func posFromScreen(screenPos):
	position.x = screenPos.x
	position.y = screenPos.y / Y_SCALE