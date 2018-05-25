extends Node

var levels = ["me"]
var poems = {}
var gainedPoems = ["filth","tango"]
var door = null

func _enter_tree():
	initPoems()

func initPoems():
	var file = File.new()
	file.open("res://poems/poems.json",File.READ)
	poems.parse_json(file.get_as_text())

func transport(map,startDoor):
	door = startDoor
	get_tree().change_scene("res://levels/%s.tscn" % map)

func joinArray(array):
	var output = ""
	for i in range(array.size()):
		output += array[i] + ("@^@" if i != array.size() - 1 else "")
	return output

func splitArray(string):
	return Array(string.split("@^@"))

func saveGame():
	var file = File.new()
	file.open("user://pic.pig",File.WRITE)
	file.store_line(joinArray(levels))
	file.close()

func loadGame():
	var file = File.new()
	file.open("user://pic.pig",File.READ)
	levels = splitArray(file.get_line())
	file.close()
