extends "res://scripts/spriteBox.gd"

define(ENTER_TY,yield(enter("character/$2","$1",$3,middle,$4),"tweened"))
define(ENTER_Y,yield(enter("character/$2","$1",$3),"tweened"))
define(ENTER,enter("character/$2","$1",$3))
define(EXIT_Y,yield(exit("$1",$2),"tweened"))
define(SAY,yield(say("$1",""$2""),"read"))
define(MUSIC,changeMusic("$1"))
define(BACKGROUND,yield(changeBackground("bg/$1"),"tweened"))
define(CLEAR,yield(clear("bg/$1"),"tweened"))
define(STILL,yield(clear("still/$1"),"tweened"))
define(TRANSPORT,global.transport("$1"))
define(SOUND,playSample("$1"))
define(SOUND_Y,yield(playSample("$1"),"finished"))
