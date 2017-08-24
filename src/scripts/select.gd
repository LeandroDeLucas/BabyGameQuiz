extends Panel

func _ready():
	load_current_buttons_labels()
	assign_buttons_actions()

func assign_buttons_actions():
	get_node("Menu/Letters").connect("pressed",self,"load_scene",["letters"])
	get_node("Menu/AntGame").connect("pressed",self,"load_scene",["ant_game"])

func load_current_buttons_labels():
	get_node("Menu/Letters").set_text("LETRAS")
	get_node("Menu/Numbers").set_text("NÚMEROS")
	get_node("Menu/Animals").set_text("ANIMAIS")
	get_node("Menu/Collors").set_text("CORES")
	get_node("Menu/AntGame").set_text("MATAR FORMIGAS")

func load_scene(scene):
	get_tree().change_scene("res://scenes/"+scene+".tscn")
	print("debug: got here")
