extends Node2D

func _ready():
	# defines a fixed process to be run every frame (delta)
	set_fixed_process(true)
	# define process to every input event
	set_process_input(true)

# define process on every input event
func _input(event):
	# check if mouse button is leftbutton and if mouse event is between this
	# object position +16 and -16 on width and hight, it matched then this
	# object should hide itself
	if(event.type == InputEvent.MOUSE_BUTTON):
		if(event.button_index == BUTTON_LEFT):
			if(event.x > (self.get_parent().get_pos().x - 16)):
				if(event.x < (self.get_parent().get_pos().x + 16)):
					if(event.y > (self.get_parent().get_pos().y - 16)):
						if(event.y < (self.get_parent().get_pos().y + 32)):
							self.set_hidden(true)

# defined process on every frame (delta)
func _fixed_process(delta):
	# every delt move this object on path 200*delta where delta is a calculum
	# to balance fps
	get_parent().set_offset(get_parent().get_offset()+(200*delta))

