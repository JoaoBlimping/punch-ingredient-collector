extends Sprite

export (String)var dependants = ""

onready var pin = preload("res://objects/pin.tscn")

func _ready():
	var global = get_node("/root/global")
	#if (!global.levels.has(get_name())): removeDependants()
	add_child(pin.instance())

func _draw():
	var pos = get_pos()
	var split = dependants.split(",")
	for dependant in split:
		if (dependant == ""): continue
		var node = get_node("../%s" % dependant)
		if (node == null or node.is_queued_for_deletion()): continue
		var dependantPos = node.get_pos()
		draw_line(Vector2(),(dependantPos - pos) - Vector2(0,2), 0x6a0d00ff,4)
		draw_line(Vector2(),dependantPos - pos, 0xba0d00ff,3)

func remove():
	removeDependants()
	queue_free()

func removeDependants():
	var split = dependants.split(",")
	for dependant in split:
		if (dependant == ""): continue
		var node = get_node("../%s" % dependant)
		if (node != null): node.remove()
	set_opacity(0.8)