extends Node2D

var tweenSprite = preload("res://scripts/tweenSprite.gd")



signal tweened


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



