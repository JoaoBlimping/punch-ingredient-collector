include(global.gd)

func _ready():
  MUSIC(party)
  BACKGROUND(gradient)
  ENTER_Y(1,bat,from_bottom)
  ENTER_Y(2,bat,from_bottom)
  ENTER_Y(3,bat,from_bottom)
  ENTER_Y(4,bat,from_bottom)
  ENTER_Y(5,bat,from_bottom)

  SAY(Angela Crawfordstein,"helkl eyah\nI am seriously going to kill you one day it's\nnot a \\
   fuckling JOKE I AM GOING TO KILL YOU Orange Man")

  EXIT_Y(1,from_bottom)
  EXIT_Y(2,from_bottom)
  EXIT_Y(3,from_bottom)
  EXIT_Y(4,from_bottom)
  EXIT_Y(5,from_bottom)

  MUSIC(satanic)
  BACKGROUND(fire)

  SAY(narattoror,"Meanwhile at tango's house")
  ENTER_Y(car,car,from_left,middle)
  SAY(Angela Crawfordstein,"It's nice out")
  EXIT_Y(car,from_right)

  TRANSPORT(glassCave)
