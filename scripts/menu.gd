extends Sprite

func about():
	get_tree().change_scene("res://scenes/author.tscn")


func play():
	get_node("/root/global").read("start")

func quit():
	get_tree().quit()