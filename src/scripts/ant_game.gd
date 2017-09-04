extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var antinstance
var visibleAntsLimit=10
var allAntsAreKilled=false
var time_start = 0
var time_now = 0

onready var newantstimer = get_node("NewAntsTimer")

func _ready():
	time_start = OS.get_unix_time()
	antinstance = preload("res://scenes/ant.tscn")
	newantstimer.connect("timeout",self,"add_new_ants")
	add_new_ants()
	set_fixed_process(true)

func add_new_ants():
	if(GLOBAL.get_visible_ants() < visibleAntsLimit && allAntsAreKilled == false ):
		GLOBAL.set_inc_visible_ants(2)
		get_node("SecondPath").add_child(antinstance.instance())
		get_node("FirstPath").add_child(antinstance.instance())

func game_has_ended():
	get_node("AudienceNode2D/SamplePlayer2D").play("audience")
	get_node("AudienceNode2D/AudienceSprite/AnimationPlayer").play("Success")

func set_enlapsed_time_to_label():
	time_now = OS.get_unix_time()
	var elapsed = time_now - time_start
	var minutes = elapsed / 60
	var seconds = elapsed % 60
	var str_elapsed = "%02d : %02d" % [minutes, seconds]
	get_node("EnlapsedTimeLabel").set_text(str_elapsed)

func _fixed_process(delta):
	if(GLOBAL.get_visible_ants() < 1):
		if(allAntsAreKilled==false):
			game_has_ended()
		allAntsAreKilled=true
	else:
		set_enlapsed_time_to_label()
	get_node("AntAliveLabel").set_text(str(GLOBAL.get_visible_ants()))
	get_node("NewAntsTimer").set_wait_time(get_node("NewAntsTimer").get_wait_time()+(delta/20))
