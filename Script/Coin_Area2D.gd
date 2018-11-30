extends Area2D

var click = false
onready var tweenNode = get_node("Tween")

func _process(delta):
	if click:
		tweenNode.interpolate_property(get_node("../"),"position",get_node("../").position, get_node("../../GUI/Position2D").position,1,Tween.TRANS_EXPO,Tween.EASE_OUT)
		tweenNode.start()
		click = false
	
	
func _input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
        self.on_click()

func on_click():
	if !click:
		
		click = true