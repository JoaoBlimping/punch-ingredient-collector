include(global.gd)
include(characters.gd)



func _ready():
  #boating about
  MUSIC(forest)
  BACKGROUND(lakeTop)
  SOUND(swish)
  ENTER_Y(o;orangeManLeaf;from_right)
  SAY(o;"hell yeah, it's nice out here on the lake at night.")
  SOUND(swish)
  EXIT_Y(o;from_left)


  #introduction
  ENTER(o; orangeMan; fade)
  BACKGROUND(lake)
  SAY(o; "Nice to be alone for a change too.
          Makes a nice change from the fucking morons in orange town anyway.")
  SAY(o; "It would be nice to meet somebody interesting again like the Stasbango. Not very
          likely to happen in the middle of a lake at midnight though I guess.")


  #meeting g
  CLEAR(lakeTop)
  ENTER_TY(g; drownedGirl; fade; 3.78)
  SAY(g; "Ahhhhh, fresh air. What a pleasant even...")
  SOUND(swish)
  ENTER_Y(o; orangeManLeaf; from_right)


  #whoh
  STILL(woah)
  SAY(o; "woah!")


  #saying more stuff
  ENTER(g; drownedGirl; fade)
  ENTER(o; orangeManLeaf; fade)
  BACKGROUND(lakeTop)
  SAY(g; "Fuck mate, you almost ran me over")
  SAY(o; "I'm sorry. I'm just a bit surprised to see somebody swimming in the middle of the
          night out here at the lake.")
  SAY(g; "Well you are boating out here aren't you?")
  SAY(o; "Well yeah but swimming seems kinda cold at this time.")
  SAY(g; "Aha, but you see I am dead.")
  SAY(o; "hhhhhhhhhhwat really?.")
  SAY(g; "Yeah lol one time I held my breath for a week.")
  SAY(o; "That's pretty good I think, alright I guess you must be dead.
          But, if you're dead, why are you swimming around in this lake?")
  SAY(g; "I drowned on the night of the night weirds, so now I am a ghost, though I can
          only stay near to the water.")
  SAY(o; "It seems quite sad that all your friends die but you keep living.")
  SAY(g; "Don't worry, I haven't got any friends. Anyway, I can commit suicide any time
          I like, but I don't really want to yet.")
  SAY(g; "Speaking of no friends, the night of the night weirds is in 3 days, and I
          have nobody to invite as a guest to the night weird party, so would you like to come?\n
          Seeing as you go boating by yourself at midnight I get the impression you aren't
          going to be busy either.")
  SAY(o; "Hell yeah, yes please.")
  SAY(g; "We've gotta bring the punch by the way.")
  SAY(o; "cool, is it just any punch? I have a lot of orange juice if that helps.")
  SAY(g; "No lol, it's a special punch. Here, I have the recipe. I carved it onto a rock
          so it wouldn't get wet.")


  #the recipe
  CLEAR(lake)
  ENTER_Y(r; recipe; from_bottom)
  SAY(o; "LOL")
  SAY(g; "It's real, dickhead.")
  SAY(o; "Oh.\n
          Is there a shop for this kind of stuff?")
  SAY(g; "Not realy, I think they sell 70% beer in some fancy joints, but we are
          going to nick it because I don't have any money.")
  SAY(o; "haha righto. Ok well when are we going to do this?")
  EXIT_Y(r; from_bottom)


  # Back to their faces
  ENTER(g; drownedGirl; fade)
  ENTER(o; orangeManLeaf; fade)
  BACKGROUND(lakeTop)
  SAY(g; "Lets start right now.")
  SAY(o; "I've gotta go to sleep, can we start tomorrow instead?")
  SAY(g; "Oh yeah, we can, sorry I do not really need sleep anymore since I am a ghost.
          Where do you live, I'll come find you in the morning and we can get to work.")
  SAY(o; "Uhhhh, house number 3 in orange town. It's pretty close to some creeks so you
          should be ok getting there, if you can step out of the water a little bit.")
  SAY(g; "Yeah I can")
  SAY(o; "Ok cool.\n
          See you.")
  SOUND(swish)
  EXIT_Y(o; from_left)
  SAY(g; "See you.")
  EXIT_Y(g; fade)


  #orange mane's house
  ENTER(o; bedFull; fade)
  BACKGROUND(inHouse)
  SOUND_Y(knocks)
  SAY(g; "Good Morninghehe")
  SOUND_Y(knocks)
  SAY(o; "mmmmmmmmmmmmmrrrrrrrreeeeeeeeeeee")
  ENTER_Y(g; drownedGirlStanding; from_right)
  SAY(g; "Good Morninghehe")
  SAY(o; "mereeeeeeererrrrrrrrreeemmmmmmerere")
  SAY(o; "Ok I will get dressed, just wait outside")
  EXIT_Y(g; from_right)


  # Outside Orange Man's house.
  CLEAR(outsideHouse)
  ENTER_Y(g; drownedGirlStanding; from_bottom)
  ENTER_Y(o; orangeMan; from_bottom)
  SAY(o; "Ok, time to get to work. What is first on the list?")
  SAY(g; "Well we need 51 nightshade mushrooms. We can probably get those from the pine
          forest near here, right?")
  SAY(o; "Yeah true, lets go.")


  # At the forest.
  CLEAR(outsideForest)
  ENTER(g; drownedGirlStanding; fade)
  ENTER_Y(o; orangeMan; fade)
  SAY(o; "Mushroom time")


  # enter the batleele
  TRANSPORT(forest)
