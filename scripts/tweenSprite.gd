extends Sprite

signal tweened

const FOOT_ROOM = 40

var start
var finish
var opacityStart
var opacityFinish
var timer = 0
var timeFrame = 0
var alive = true

func _init(texture,centre=true):
	set_texture(load("res://pics/visual/%s.png" % texture))
	set_centered(centre)


func _process(delta):
	timer += delta
	set_pos(start + finish * timer / timeFrame)
	set_opacity(opacityStart + opacityFinish * timer / timeFrame)
	if (timer >= timeFrame):
		set_pos(start + finish)
		set_opacity(opacityStart + opacityFinish)
		set_process(false)
		emit_signal("tweened")

func go(target,time,opacityTarget=1):
	start = get_pos()
	finish = target - start
	opacityStart = get_opacity()
	opacityFinish = opacityTarget - opacityStart
	timer = 0
	timeFrame = time
	set_process(true)

func getWidth():
	return get_texture().get_width()

func getHeight():
	return get_texture().get_height()