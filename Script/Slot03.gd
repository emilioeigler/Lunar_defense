extends Area2D

var seleccion = false

func _process(delta):
	if seleccion:
		$Select.visible = true
	else:
		$Select.visible = false
		
func _input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
        self.on_click()

func on_click():
	if get_node("../").activo2==true:
		seleccion = true
		get_node("../Slot01").seleccion = false
		get_node("../Slot02").seleccion = false
		get_node("../Slot04").seleccion = false