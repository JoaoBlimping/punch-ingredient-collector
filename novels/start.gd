extends "res://scripts/spriteBox.gd"









func _ready():
  changeMusic("party")
  yield(changeBackground("gradient"),"tweened")
  yield(enter("bat","1",from_bottom),"tweened")
  yield(enter("bat","2",from_bottom),"tweened")
  yield(enter("bat","3",from_bottom),"tweened")
  yield(enter("bat","4",from_bottom),"tweened")
  yield(enter("bat","5",from_bottom),"tweened")

  yield(say("Angela Crawfordstein","""helkl eyah\nI am seriously going to kill you one day it's\nnot a \\
   fuckling JOKE I AM GOING TO KILL YOU Orange Man"""),"read")

  yield(exit("1",from_bottom),"tweened")
  yield(exit("2",from_bottom),"tweened")
  yield(exit("3",from_bottom),"tweened")
  yield(exit("4",from_bottom),"tweened")
  yield(exit("5",from_bottom),"tweened")

  changeMusic("satanic")
  yield(changeBackground("fire"),"tweened")

  yield(say("narattoror","""Meanwhile at tango's house"""),"read")
  yield(enter("car","car",from_left),"tweened")
  yield(say("Angela Crawfordstein","""It's nice out"""),"read")
  yield(exit("car",from_right),"tweened")

  global.transport("glassCave")
