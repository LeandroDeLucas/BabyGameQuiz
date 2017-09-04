extends Node2D

var touch_on_execution=false

func _ready():
	# defines a fixed process to be run every frame (delta)
	set_fixed_process(true)
	get_node("Area2D").connect("input_event", self,"_on_Area2D_input_event")
	get_node("AntPlayer").play("AntWalk")
	randomize()
	var new_color=Color(randf(),randf(),randf(),1)
	get_node("abdome").set_modulate(new_color)

func destroy_itself():
	self.queue_free()

# defined process to be run every frame (delta)
func _fixed_process(delta):
	# every delta move this object on path 200*delta where delta is a calculum
	# to balance fps. The higher fps is the lower delta should be.
	get_parent().set_offset(get_parent().get_offset()+(200*delta))

func i_was_touched():
	if(touch_on_execution == false):
		touch_on_execution=true
		GLOBAL.set_dec_visible_ants()
		self.set_hidden(true)
		get_node("SamplePlayer2D").play("jab")
		get_node("SamplePlayer2D").connect("finished", self, "destroy_itself")

func _draw():  
   # each frame draw a bounding rect to show boundaries clearer
   #self.draw_rect(self.get_item_rect(),Color(0,0,1,0.2))
	pass

func _on_Area2D_input_event( viewport, event, shape_idx ):
	if(event.type ==  InputEvent.MOUSE_BUTTON):
		if(event.button_index == BUTTON_LEFT):
			i_was_touched()
