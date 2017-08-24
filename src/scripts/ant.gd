extends Node2D

func _ready():
	set_fixed_process(true)
	set_process_input(true)

func _input(event):
	if(event.type == InputEvent.MOUSE_BUTTON):
		if(event.button_index == BUTTON_LEFT):
			print(self.get_parent().get_pos().x)
			if(event.x > (self.get_parent().get_pos().x - 16)):
				if(event.x < (self.get_parent().get_pos().x + 16)):
					if(event.y > (self.get_parent().get_pos().y - 16)):
						if(event.y < (self.get_parent().get_pos().y + 32)):
							self.set_hidden(true)

func _fixed_process(delta):
	get_parent().set_offset(get_parent().get_offset()+(200*delta))

