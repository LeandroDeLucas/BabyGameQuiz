extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var antinstance
var visibleAntsLimit=10
onready var newantstimer = get_node("NewAntsTimer")

func _ready():
	antinstance = preload("res://scenes/ant.tscn")
	newantstimer.connect("timeout",self,"add_new_ants")
	add_new_ants()
	set_fixed_process(true)

func add_new_ants():
	if(GLOBAL.get_visible_ants() < visibleAntsLimit):
		GLOBAL.set_inc_visible_ants(2)
		get_node("SecondPath").add_child(antinstance.instance())
		get_node("FirstPath").add_child(antinstance.instance())

func _fixed_process(delta):
	get_node("AntAliveLabel").set_text(str(GLOBAL.get_visible_ants()))