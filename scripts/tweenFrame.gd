extends Node2D

var tweenSprite = preload("res://scripts/tweenSprite.gd")

enum ENTRANCES {from_left,from_right,from_top,from_bottom,fade}
enum POSITIONS {left,middle,right}

signal tweened

const DEFAULT_TWEEN = 0.5
onready var screen = get_viewport_rect()
var zDistance
var start
var finish
var timer = 0
var timeFrame = 0


func _init(z,scaling):
	zDistance = z
	set_scale(Vector2(1 - tanh((1 - z) / scaling),1 - tanh((1 - z) / scaling)))


func _process(delta):
	timer += delta
	set_scale(start + finish * timer / timeFrame)
	if (timer >= timeFrame):
		set_scale(start + finish)
		set_process(false)
		emit_signal("tweened")

func go(target,time):
	start = get_scale()
	finish = target - start
	timer = 0
	timeFrame = time
	set_process(true)

func settle():
	var section = screen.size.x / get_child_count()
	var i = 0
	for child in get_children():
		var idealX = section * i + section / 2 - screen.size.x / 2
		child.go(Vector2(idealX,0),DEFAULT_TWEEN)
		i += 1

func addSprite(name,entrance,position,fixTop=true):
	var sprite = tweenSprite.new(name,fixTop)
	sprite.set_name(name)
	add_child(sprite)
	if (position == left): move_child(sprite,0)
	if (position == middle): move_child(sprite,round(get_child_count() / 2))
	
	if (entrance == fade):
		sprite.set_opacity(0)
		sprite.set_global_pos(Vector2(screen.size.x / 2,screen.size.y / 2))
	if (entrance == from_top): sprite.set_global_pos(Vector2(screen.size.x / 2,-100))
	if (entrance == from_right): sprite.set_global_pos(Vector2(screen.size.x,screen.size.y / 2))
	if (entrance == from_bottom): sprite.set_global_pos(Vector2(screen.size.x / 2,screen.size.y))
	if (entrance == from_left): sprite.set_global_pos(Vector2(0,screen.size.y / 2))
	
	settle()
	return sprite

func removeSprite(name,entrance):
	var sprite = get_node(name)
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

func spriteRemoved(sprite):
	remove_child(sprite)
	settle()
	emit_signal("tweened")