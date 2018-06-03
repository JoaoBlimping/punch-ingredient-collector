extends Node2D

var tweenSprite = preload("res://scripts/tweenSprite.gd")
var textbox = preload("res://objects/textbox.tscn")

enum ENTRANCES {from_left,from_right,from_top,from_bottom,fade}
enum POSITIONS {left,middle,right}
const DEFAULT_TWEEN = 0.4
signal tweened

onready var global = get_node("/root/global")
onready var background = get_node("../background")
onready var gui = get_node("../gui")
onready var screen = get_viewport_rect()
onready var music = get_node("../music")
onready var sound = get_node("../sound")
var guid = false


func _enter_tree():
	set_process(true)
	set_script(load("res://novels/%s.gd" % get_node("/root/global").novel))

func playSample(sample):
	sound.set_stream(load("res://sounds/%s.ogg" % sample))
	sound.play()
	return sound

func changeMusic(song):
	music.set_stream(load("res://songs/%s.ogg" % song))
	music.play()

func clear(texture,entrance=fade):
	for child in get_children():
		exit(child.get_name())
	return changeBackground(texture)

func changeBackground(texture):
	settlePositions()
	var pic = tweenSprite.new(texture,false)
	background.add_child(pic)
	pic.set_opacity(0)
	pic.go(Vector2(),DEFAULT_TWEEN,1)
	pic.connect("tweened",self,"backgroundChanged",[pic])
	return self

func backgroundChanged(pic):
	for child in background.get_children(): if (child != pic): child.queue_free()
	emit_signal("tweened")


func say(name,text,replies=["->"]):
	if (guid): return null
	guid = true
	var ib = textbox.instance()
	gui.add_child(ib)
	ib.get_node("name").set_text(name)
	text = text.replace("  ","").replace("\n\n","%^&").replace("\n"," ").replace("%^&","\n")
	ib.get_node("content").set_text(text)
	
	for i in range(replies.size()):
		var button = Button.new()
		button.set_text(replies[i])
		button.set_v_size_flags(Control.SIZE_EXPAND_FILL)
		button.connect("button_down",ib,"pressed",[i])
		ib.get_node("vbox").add_child(button)
	ib.connect("read",self,"removeTextbox",[ib])
	return ib


func removeTextbox(index,box):
	guid = false


func settle(time=DEFAULT_TWEEN):
	var section = screen.size.x / getAliveChildrenCount()
	var i = 0
	for child in get_children():
		if (not child.alive): continue
		var idealX = section * i + section / 2 - screen.size.x / 2
		child.go(Vector2(idealX,0),time)
		i += 1

func settlePositions():
	var section = screen.size.x / getAliveChildrenCount()
	var i = 0
	for child in get_children():
		if (not child.alive): continue
		var idealX = section * i + section / 2 - screen.size.x / 2
		child.start = Vector2(idealX,0)
		child.finish = Vector2()
		i += 1

func enter(name,specialName,entrance=fade,position=middle,time=DEFAULT_TWEEN):
	var sprite = tweenSprite.new(name)
	sprite.set_name(specialName)
	add_child(sprite)
	if (position == left): move_child(sprite,0)
	if (position == middle): move_child(sprite,round(get_child_count() / 2))
	
	if (entrance == fade):
		sprite.set_opacity(0)
		sprite.set_global_pos(Vector2(screen.size.x / 2,screen.size.y / 2))
	if (entrance == from_top): sprite.set_global_pos(Vector2(screen.size.x / 2,-sprite.getHeight() / 2))
	if (entrance == from_right): sprite.set_global_pos(Vector2(screen.size.x + sprite.getWidth() / 2,screen.size.y / 2))
	if (entrance == from_bottom): sprite.set_global_pos(Vector2(screen.size.x / 2,screen.size.y + sprite.getHeight() / 2))
	if (entrance == from_left): sprite.set_global_pos(Vector2(-sprite.getWidth() / 2,screen.size.y / 2))
	settle(time)
	return sprite


func exit(name,entrance=fade):
	var sprite = get_node(name)
	sprite.alive = false
	var target = Vector2()
	var opacityTarget = 1
	if (entrance == fade):
		opacityTarget = 0
		target = sprite.get_pos()
	if (entrance == from_top): target.y = -screen.size.y
	if (entrance == from_right): target.x = screen.size.x / 2
	if (entrance == from_bottom): target.y = screen.size.y
	if (entrance == from_left): target.x = -screen.size.x / 2
	sprite.go(target,DEFAULT_TWEEN,opacityTarget)
	sprite.connect("tweened",self,"spriteRemoved",[sprite])
	return self

func getAliveChildrenCount():
	var total = 0
	for child in get_children(): if (child.alive): total += 1
	return total


func spriteRemoved(sprite):
	remove_child(sprite)
	sprite.queue_free()
	yield(get_tree(), "idle_frame")
	emit_signal("tweened")