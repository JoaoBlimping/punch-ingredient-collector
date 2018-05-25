extends Node2D

onready var hud = preload("res://objects/hud.tscn")
onready var textbox = preload("res://objects/textbox.tscn")
onready var QuadTree = preload("res://scripts/QuadTree.gd")
onready var player = preload("res://objects/player.tscn")
onready var dudes = get_node("dudes")
onready var global = get_node("/root/global")
var music
var gui
var guid = false
export (String,FILE)var song = null

func _ready():
	set_process(true)
	gui = CanvasLayer.new()
	music = StreamPlayer.new()
	music.set_loop(true)
	add_child(gui)
	add_child(music)
	add_child(hud.instance())
	if (song != null):
		music.set_stream(load(song))
		music.play()
		
	#place the player
	if (global.door != null):
		var ib = player.instance()
		dudes.add_child(ib)
		ib.posFromScreen(dudes.get_node("%s/drop" % global.door).get_global_pos())
	
	dudes.get_node("player").fixCamera(get_node("ground").get_region_rect().size)

func _process(delta):
	var enemies = dudes.get_children()
	
	for i in range(enemies.size()):
		var child = enemies[i]
		if (child.collisionMask == 1 or not child.collider): continue
		for u in range(i,enemies.size()):
			var other = enemies[u]
			if (child == other or not other.collider): continue
			if (child.isColliding(other)):
				child.hit(other)
				if (other.collisionMask == 0): other.hit(child)

func say(name,text,replies=["->"]):
	if (guid): return null
	guid = true
	var ib = textbox.instance()
	gui.add_child(ib)
	ib.get_node("name").set_text(name)
	ib.get_node("content").set_text(text)
	
	for i in range(replies.size()):
		var button = Button.new()
		button.set_text(replies[i])
		button.set_v_size_flags(Control.SIZE_EXPAND_FILL)
		button.connect("button_down",ib,"pressed",[i])
		ib.get_node("vbox").add_child(button)
	for dude in dudes.get_children(): dude.set_process(false)
	ib.connect("read",self,"removeTextbox",[ib])
	return ib

func removeTextbox(index,box):
	guid = false
	for dude in dudes.get_children(): dude.set_process(true)

func quietMusic():
	music.set_volume(0.5)

func restoreMusic():
	music.set_volume(1)