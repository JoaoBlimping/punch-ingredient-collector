extends Sprite

const SPEED = -400

func _ready():
	set_process(true)

func _process(delta):
	var region = get_region_rect()
	region.pos += Vector2(randf(),randf()) * SPEED * delta
	set_region_rect(region)
	
	