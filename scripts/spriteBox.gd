extends Node2D

var tweenFrame = preload("res://scripts/tweenFrame.gd")
var tweenSprite = preload("res://scripts/tweenSprite.gd")
var textbox = preload("res://objects/textbox.tscn")

const SCALE_MULTIPLIER = 3
const BACK_Z = 0.1
onready var gui = get_node("../gui")
var frames = []
var camera = Vector3(0,0,1)
var guid = false


func _ready():
	set_process(true)
	
	addBackground("gradient")
	
	var frame = tweenFrame.new(0.5,SCALE_MULTIPLIER)
	frames.append(frame)
	add_child(frame)
	
	frame = tweenFrame.new(1.5,SCALE_MULTIPLIER)
	frames.append(frame)
	add_child(frame)
	
	yield(addSprite("bat",tweenFrame.from_bottom,tweenFrame.middle,1),"tweened")
	yield(addSprite("bat",tweenFrame.from_bottom,tweenFrame.middle,1),"tweened")
	yield(addSprite("bat",tweenFrame.from_bottom,tweenFrame.middle,1),"tweened")
	yield(addSprite("bat",tweenFrame.from_bottom,tweenFrame.middle,1),"tweened")
	yield(addSprite("bat",tweenFrame.from_bottom,tweenFrame.middle,1),"tweened")
	
	yield(moveCamera(Vector3(0,0,2)),"tweened")
	
	yield(say("Angela Crawfordstein","helkl eyah\nI am seriously going to kill you one day it's\nnot a fuckling JOKE I AM GOING TO KILL YOU Orange Man"),"read")
	
	yield(addSprite("car",tweenFrame.from_left,tweenFrame.middle,2),"tweened")
	yield(say("Shadow Man","Get in the car you dumb bitch"),"read")
	
	yield(frames[1].removeSprite("bat",tweenFrame.fade),"tweened")
	yield(frames[2].removeSprite("car",tweenFrame.from_right),"tweened")
	
	yield(moveCamera(Vector3(0,0,1)),"tweened")
	
	yield(say("Mr Skeletal","lol what a dumb bitch"),"read")
	

func addSprite(name,entrance,position,frame=0):
	return frames[frame].addSprite(name,entrance,position)

func moveCamera(position):
	camera = position
	for frame in frames:
		var distance = position.z - frame.zDistance
		frame.go(Vector2(1 - tanh(distance / SCALE_MULTIPLIER),1 - tanh(distance / SCALE_MULTIPLIER)),1)
	return frames.front()

func addBackground(texture):
	var frame = tweenFrame.new(BACK_Z,SCALE_MULTIPLIER)
	add_child(frame)
	frames.append(frame)
	frame.addSprite(texture,tweenFrame.fade,tweenFrame.middle,false)

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
	ib.connect("read",self,"removeTextbox",[ib])
	return ib

func removeTextbox(index,box):
	guid = false