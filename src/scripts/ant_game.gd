extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("Path2D/PathFollow2D/Ant/AntPlayer").play("AntWalk");
