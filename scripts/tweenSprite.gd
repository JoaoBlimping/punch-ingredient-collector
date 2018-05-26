extends Sprite

signal tweened

const FOOT_ROOM = 40

var start
var finish
var opacityStart
var opacityFinish
var timer = 0
var timeFrame = 0
var modifyOffset = true

func _init(texture,fixTop=true,centre=true):
	set_texture(load("res://pics/visual/%s.png" % texture))
	modifyOffset = fixTop
	set_centered(centre)

func _ready():
	if (modifyOffset):
		var screenHeight = get_viewport_rect().size.y
		var height = get_texture().get_height()
		set_offset(Vector2(0,screenHeight / 2 - height / 2 + FOOT_ROOM))


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