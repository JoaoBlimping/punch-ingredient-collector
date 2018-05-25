extends Node

const MAX_CHILDREN = 5

var trueMax
var children = []
var tl = null
var tr = null
var bl = null
var br = null
var split = false
var area

func _init(rect,maxChildren=MAX_CHILDREN):
	area = rect
	trueMax = maxChildren

func addChild(child):
	if (split): addToBranch(child)
	else:
		children.append(child)
		if (children.size() > MAX_CHILDREN):
			split = true
			tl = get_script().new(Rect2(area.pos,area.size / 2),trueMax + 1)
			tr = get_script().new(Rect2(area.pos + Vector2(area.size.x / 2,0),area.size / 2),trueMax + 1)
			bl = get_script().new(Rect2(area.pos + Vector2(0,area.size.y / 2),area.size / 2),trueMax + 1)
			br = get_script().new(Rect2(area.pos + area.size / 2,area.size / 2),trueMax + 1)
			
			var oldChildren = []
			for child in children: oldChildren.append(child)
			children.clear()
			
			while (oldChildren.size() > 0):
				addToBranch(oldChildren.front())
				oldChildren.pop_front()

func addToBranch(child):
	var dimensions = Vector2(child.radius,child.radius)
	var shape = Rect2(child.get_pos() - dimensions,dimensions * 5)
	var ins = 0
	if (tl.area.has_point(shape.pos)): ins |= 1
	if (tr.area.has_point(shape.pos + Vector2(shape.size.x,0))): ins |= 2
	if (bl.area.has_point(shape.pos + Vector2(0,shape.size.y))): ins |= 4
	if (br.area.has_point(shape.pos + shape.size)): ins |= 8
	
	if (ins == 1): tl.addChild(child)
	elif (ins == 2): tr.addChild(child)
	elif (ins == 4): bl.addChild(child)
	elif (ins == 8): br.addChild(child)
	else: children.append(child)

func collision():
	for i in range(children.size()):
		var child = children[i]
		if (split):
			tl.overCollision(child)
			tr.overCollision(child)
			bl.overCollision(child)
			br.overCollision(child)
		if (child.collisionMask == 1): continue
		for u in range(i,children.size()):
			var other = children[u]
			if (child == other): continue
			if (child.isColliding(other)):
				child.hit(other)
				if (other.collisionMask == 0): other.hit(child)
	if (split):
		tl.collision()
		tr.collision()
		bl.collision()
		br.collision()


func overCollision(over):
	for child in children:
		if (over.isColliding(child)):
			over.hit(child)
			if (child.collisionMask == 0): child.hit(over)
	if (split):
		tl.overCollision(over)
		tr.overCollision(over)
		bl.overCollision(over)
		br.overCollision(over)

func printOut(start=""):
	for child in children: print(start,":",child.get_name())
	if (tl != null): tl.printOut(start+":tl")
	if (tr != null): tr.printOut(start+":tr")
	if (bl != null): bl.printOut(start+":bl")
	if (br != null): br.printOut(start+":br")