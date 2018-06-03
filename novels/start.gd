extends "res://scripts/spriteBox.gd"




















func _ready():
  #boating about
  changeMusic("forest")
  yield(changeBackground("bg/lakeTop"),"tweened")
  playSample("swish")
  yield(enter("character/orangeManLeaf","Orange Man",from_right),"tweened")
  yield(say("Orange Man","""hell yeah, it's nice out here on the lake at night."""),"read")
  playSample("swish")
  yield(exit("Orange Man",from_left),"tweened")

  #introduction
  enter("character/orangeMan","Orange Man",fade)
  yield(changeBackground("bg/lake"),"tweened")
  yield(say("Orange Man","""Nice to be alone for a change too.
          Makes a nice change from the fucking morons in orange town anyway."""),"read")
  yield(say("Orange Man","""It would be nice to meet somebody interesting again like the Stasbango. Not very
          likely to happen in the middle of a lake at midnight though I guess."""),"read")

  #meeting g
  yield(clear("bg/lakeTop"),"tweened")
  yield(enter("character/drownedGirl","Drowned Girl",fade,middle,3.78),"tweened")
  yield(say("Drowned Girl","""Ahhhhh, fresh air. What a pleasant even..."""),"read")
  playSample("swish")
  yield(enter("character/orangeManLeaf","Orange Man",from_right),"tweened")

  #whoh
  yield(clear("still/woah"),"tweened")
  yield(say("Orange Man","""woah!"""),"read")

  #saying more stuff
  enter("character/drownedGirl","Drowned Girl",fade)
  enter("character/orangeManLeaf","Orange Man",fade)
  yield(changeBackground("bg/lakeTop"),"tweened")
  yield(say("Drowned Girl","""Fuck mate, you almost ran me over"""),"read")
  yield(say("Orange Man","""I'm sorry. I'm just a bit surprised to see somebody swimming in the middle of the
          night out here at the lake."""),"read")
  yield(say("Drowned Girl","""Well you are boating out here aren't you?"""),"read")
  yield(say("Orange Man","""Well yeah but swimming seems kinda cold at this time."""),"read")
  yield(say("Drowned Girl","""Aha, but you see I am dead."""),"read")
  yield(say("Orange Man","""hhhhhhhhhhwat really?."""),"read")
  yield(say("Drowned Girl","""Yeah lol one time I held my breath for a week."""),"read")
  yield(say("Orange Man","""That's pretty good I think, alright I guess you must be dead.
          But, if you're dead, why are you swimming around in this lake?"""),"read")
  yield(say("Drowned Girl","""I drowned on the night of the night weirds, so now I am a ghost, though I can
          only stay near to the water."""),"read")
  yield(say("Orange Man","""It seems quite sad that all your friends die but you keep living."""),"read")
  yield(say("Drowned Girl","""Don't worry, I haven't got any friends. Anyway, I can commit suicide any time
          I like, but I don't really want to yet."""),"read")
  yield(say("Drowned Girl","""Speaking of no friends, the night of the night weirds is in 3 days, and I
          have nobody to invite as a guest to the night weird party, so would you like to come?\n
          Seeing as you go boating by yourself at midnight I get the impression you aren't
          going to be busy either."""),"read")
  yield(say("Orange Man","""Hell yeah, yes please."""),"read")
  yield(say("Drowned Girl","""We've gotta bring the punch by the way."""),"read")
  yield(say("Orange Man","""cool, is it just any punch? I have a lot of orange juice if that helps."""),"read")
  yield(say("Drowned Girl","""No lol, it's a special punch. Here, I have the recipe. I carved it onto a rock
          so it wouldn't get wet."""),"read")

  #the recipe
  yield(clear("bg/lake"),"tweened")
  yield(enter("character/recipe","r",from_bottom),"tweened")
  yield(say("Orange Man","""LOL"""),"read")
  yield(say("Drowned Girl","""It's real, dickhead."""),"read")
  yield(say("Orange Man","""Oh.\n
          Is there a shop for this kind of stuff?"""),"read")
  yield(say("Drowned Girl","""Not realy, I think they sell 70% beer in some fancy joints, but we are
          going to nick it because I don't have any money."""),"read")
  yield(say("Orange Man","""haha righto. Ok well when are we going to do this?"""),"read")
  yield(exit("r",from_bottom),"tweened")

  # Back to their faces
  enter("character/drownedGirl","Drowned Girl",fade)
  enter("character/orangeManLeaf","Orange Man",fade)
  yield(changeBackground("bg/lakeTop"),"tweened")
  yield(say("Drowned Girl","""Lets start right now."""),"read")
  yield(say("Orange Man","""I've gotta go to sleep, can we start tomorrow instead?"""),"read")
  yield(say("Drowned Girl","""Oh yeah, we can, sorry I do not really need sleep anymore since I am a ghost.
          Where do you live, I'll come find you in the morning and we can get to work."""),"read")
  yield(say("Orange Man","""Uhhhh, house number 3 in orange town. It's pretty close to some creeks so you
          should be ok getting there, if you can step out of the water a little bit."""),"read")
  yield(say("Drowned Girl","""Yeah I can"""),"read")
  yield(say("Orange Man","""Ok cool.\n
          See you."""),"read")
  playSample("swish")
  yield(exit("Orange Man",from_left),"tweened")
  yield(say("Drowned Girl","""See you."""),"read")
  yield(exit("Drowned Girl",fade),"tweened")

  #orange mane's house
  enter("character/bedFull","Orange Man",fade)
  yield(changeBackground("bg/inHouse"),"tweened")
  yield(playSample("knocks"),"finished")
  yield(say("Drowned Girl","""Good Morninghehe"""),"read")
  yield(playSample("knocks"),"finished")
  yield(say("Orange Man","""mmmmmmmmmmmmmrrrrrrrreeeeeeeeeeee"""),"read")
  yield(enter("character/drownedGirlStanding","Drowned Girl",from_right),"tweened")
  yield(say("Drowned Girl","""Good Morninghehe"""),"read")
  yield(say("Orange Man","""mereeeeeeererrrrrrrrreeemmmmmmerere"""),"read")
  yield(say("Orange Man","""Ok I will get dressed, just wait outside"""),"read")
  yield(exit("Drowned Girl",from_left),"tweened")

  # Outside Orange Man's house.
  yield(clear("bg/outsideHouse"),"tweened")
  yield(enter("character/drownedGirlStanding","Drowned Girl",from_bottom),"tweened")
  yield(enter("character/orangeMan","Orange Man",from_bottom),"tweened")
  yield(say("Orange Man","""Ok, time to get to work. What is first on the list?"""),"read")
  yield(say("Drowned Girl","""Well we need 51 nightshade mushrooms. We can probably get those from the pine
          forest near here, right?"""),"read")
  yield(say("Orange Man","""Yeah true, lets go."""),"read")

  # At the forest.
  yield(clear("bg/outsideForest"),"tweened")
  enter("character/drownedGirlStanding","Drowned Girl",fade)
  yield(enter("character/orangeMan","Orange Man",fade),"tweened")
  yield(say("Orange Man","""Mushroom time"""),"read")


  # enter the batleele
  global.transport("forest")
