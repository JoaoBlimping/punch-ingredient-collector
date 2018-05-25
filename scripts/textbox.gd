extends Panel

signal read

func _ready():
	get_node("sample").play("next")

func pressed(index):
	emit_signal("read",index)
	queue_free()
