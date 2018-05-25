extends Sprite

func about():
	get_tree().change_scene("res://scenes/author.tscn")


func play():
	get_tree().change_scene("res://levels/town.tscn")

func quit():
	get_tree().quit()