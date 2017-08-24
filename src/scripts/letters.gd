extends Panel

onready var ladyplayer = get_node("LadyBug/LadyBugPlayer")
onready var scenarioplayer = get_node("Scenario/ScenarioPlayer")
onready var lettersplayer = get_node("LettersPanel/LettersSound")
onready var blinktimer = get_node("Timer")


func _ready():
	# check if it is our first run
	if(!GLOBAL.get_is_game_started()):
		# flag game as started
		GLOBAL.set_game_start()
		# get first new buttons set
		draw_new_buttons_set()
		# starts background sound
		get_node("BackgroundSound").play("bg")
		# starts plant animation
		get_node("Scenario/ScenarioPlayer").play("PlantsMove")
		# starts stars animation
		get_node("LettersPanel/StarsLayer/AnimationPlayer").play("StarsMove")
		# starts lettersmove animation
		get_node("LettersPanel/LettersPlayer").play("LettersMove")
		# starts sheiscomming animation
		ladyplayer.play("SheIsComming")
	# assign to timer timetou ladybug_blinks animation
	blinktimer.connect("timeout",self,"ladybug_blinks")
	# assign buttons function when pressed
	var i=0
	while(i < GLOBAL.get_itens_lenght()):
		get_node("LettersPanel/ButtonsLayer/btn"+str(i)).connect("pressed",self,"button_pressed",[i])
		i=i+1
	# assign play_waiting_action every ladyplayer animation finished
	ladyplayer.connect("finished", self, "play_waiting_action")

# this function should be ran on timer timeout
func ladybug_blinks():
	ladyplayer.play("blink")
	ladyplayer.connect("finished", self, "play_waiting_action")

func play_waiting_action():
	ladyplayer.play("WaitingAction")

func button_pressed(buttonid):
	if(GLOBAL.get_busy_state() == false):
		GLOBAL.set_i_am_busy()
		lettersplayer.play(GLOBAL.get_current_soud(buttonid))
		ladyplayer.play("Click")
		ladyplayer.connect("finished", self, "button_pressed_after_anime",[buttonid])

func button_pressed_after_anime(buttonid):
	ladyplayer.play("WaitingAction")
	draw_new_buttons_set()
	GLOBAL.set_i_am_not_busy()
	ladyplayer.disconnect("finished", self, "button_pressed_after_anime")

# assign images to buttons
func draw_new_buttons_set():
	GLOBAL.set_next_random_values()
	var i=0
	while(i < GLOBAL.get_itens_lenght()):
		get_node("LettersPanel/ButtonsLayer/btn"+str(i)).set_normal_texture(load("res://sprites/default/letters/" + GLOBAL.get_current_letter(i) + ".png"))
		get_node("LettersPanel/ButtonsLayer/btn"+str(i)).set_pressed_texture(load("res://sprites/default/letters/" + GLOBAL.get_current_letter(i) + ".png"))
		i=i+1
