extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var antinstance
var visibleAntsLimit=20
onready var newantstimer = get_node("NewAntsTimer")

func _ready():
	antinstance = preload("res://scenes/ant.tscn")
	newantstimer.connect("timeout",self,"add_new_ants")
	get_node("SecondPath").add_child(antinstance.instance())
	get_node("FirstPath").add_child(antinstance.instance())


func add_new_ants():
	if(GLOBAL.get_visible_ants() < visibleAntsLimit):
		GLOBAL.set_inc_visible_ants()
		get_node("SecondPath").add_child(antinstance.instance())
		get_node("FirstPath").add_child(antinstance.instance())