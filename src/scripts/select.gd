extends Panel

func _ready():
	load_current_buttons_labels()
	assign_buttons_actions()

func assign_buttons_actions():
	get_node("Menu/Letters").connect("pressed",self,"load_scene",["letters"])

func load_current_buttons_labels():
	get_node("Menu/Letters").set_button_icon(load("res://sprites/"+GLOBAL.get_current_lang()+"/ui/letters_selection.png"))
	get_node("Menu/Numbers").set_button_icon(load("res://sprites/"+GLOBAL.get_current_lang()+"/ui/numbers_selection.png"))
	get_node("Menu/Animals").set_button_icon(load("res://sprites/"+GLOBAL.get_current_lang()+"/ui/animals_selection.png"))
	get_node("Menu/Collors").set_button_icon(load("res://sprites/"+GLOBAL.get_current_lang()+"/ui/collors_selection.png"))

func load_scene(scene):
	get_tree().change_scene("res://scenes/"+scene+".tscn")
	print("debug: got here")
