extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("Menu/Letters").set_normal_texture(load("res://sprites/"+GLOBAL.get_current_lang()+"/ui/letters_selection.png"))
