extends Node2D

func _ready():
	# defines a fixed process to be run every frame (delta)
	set_fixed_process(true)
	# define process to every input event
	set_process_input(true)
	get_node("AntPlayer").play("AntWalk")
	randomize()
	var new_color=Color(randf(),randf(),randf(),1)
	get_node("abdome").set_modulate(new_color)

# define process on every input event
func _input(event):
	# check if mouse button is leftbutton and if mouse event is between this
	# object position +16 and -16 on obj.X and obj.Y, if event matches then this
	# object should hide itself
	if(event.type == InputEvent.MOUSE_BUTTON):
		if(event.button_index == BUTTON_LEFT):
			if(event.x > (self.get_parent().get_pos().x - 16)):
				if(event.x < (self.get_parent().get_pos().x + 16)):
					if(event.y > (self.get_parent().get_pos().y - 16)):
						if(event.y < (self.get_parent().get_pos().y + 32)):
							self.queue_free()

# defined process to be run every frame (delta)
func _fixed_process(delta):
	# every delta move this object on path 200*delta where delta is a calculum
	# to balance fps. The higher fps is the lower delta should be.
	get_parent().set_offset(get_parent().get_offset()+(200*delta))

