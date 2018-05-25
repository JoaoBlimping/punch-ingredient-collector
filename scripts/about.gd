extends Label

func flip():
	set_align(randi() % 3)


func back():
	get_tree().change_scene("res://scenes/menu.tscn")
