extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("FirstPath/AntPathFollow2D/Ant/AntPlayer").play("AntWalk");
	get_node("FirstPath/Ant1AntPathFollow2D/Ant/AntPlayer").play("AntWalk");
	get_node("SecondPath/AntPathFollow2D/Ant/AntPlayer").play("AntWalk");
	get_node("SecondPath/Ant1PathFollow2D/Ant/AntPlayer").play("AntWalk");