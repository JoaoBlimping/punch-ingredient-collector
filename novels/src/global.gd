extends "res://scripts/spriteBox.gd"

define(ENTER_Y,yield(enter("$2","$1",$3),"tweened"))
define(EXIT_Y,yield(exit("$1",$2),"tweened"))
define(SAY,yield(say("$1",""$2""),"read"))
define(MUSIC,changeMusic("$1"))
define(BACKGROUND,yield(changeBackground("$1"),"tweened"))
define(TRANSPORT,global.transport("$1"))
