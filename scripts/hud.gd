extends CanvasLayer

onready var global = get_node("/root/global")
onready var player = get_node("/root/level/dudes/player")
onready var health = get_node("health")
onready var stream = get_node("poem/stream")
onready var animation = get_node("poem/animation")
onready var level = get_node("/root/level")
onready var button = get_node("poem/button")
onready var vbox = get_node("poem/vbox")
onready var title = get_node("poem/title")
var poemState = POEM_STATE.closed

enum POEM_STATE{closed,playing,open}

func _ready():
	set_process(true)
	button.connect("pressed",self,"buttonPressed")
	stream.connect("finished",self,"poemFinished")
	
	for poem in global.poems:
		var ib = Button.new()
		ib.set_text(global.poems[poem]["name"])
		ib.set_clip_text(true)
		ib.connect("pressed",self,"playPoem",[poem])
		vbox.add_child(ib)

func _process(delta):
	var texture = health.get_texture()
	var width = texture.get_width()
	var height = texture.get_height()
	health.set_region_rect(Rect2(0,0,width * player.health, height))

func buttonPressed():
	if (poemState == POEM_STATE.closed):
		animation.play("open")
		poemState = POEM_STATE.open
	elif (poemState == POEM_STATE.open):
		animation.play("close")
		poemState = POEM_STATE.closed
	elif (poemState == POEM_STATE.playing):
		stream.stop()
		poemFinished()
		

func playPoem(name):
	if (poemState == POEM_STATE.closed): animation.play("slightOpen")
	elif (poemState == POEM_STATE.open): animation.play("toSlight")
	poemState = POEM_STATE.playing
	level.quietMusic()
	title.set_text("%s by %s" % [global.poems[name]["name"],global.poems[name]["author"]])
	stream.set_stream(load("res://poems/%s.ogg" % name))
	stream.play()
	

func poemFinished():
	title.set_text("")
	animation.play("slightClose")
	poemState = POEM_STATE.closed
	level.restoreMusic()