extends Area2D

var seleccion = false

func _process(delta):
	#si seleccion es true...
	if seleccion:
		#nodo seleccion es visible
		$Select.visible = true
	else:
		$Select.visible = false
		
#funcion input sobre area
func _input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
        self.on_click()


func on_click():
	#activa y desactiva slots
	if get_node("../").activo==true:
		get_node("../Click").play()
		seleccion = true
		get_node("../Slot02").seleccion = false
		get_node("../Slot03").seleccion = false
		get_node("../Slot04").seleccion = false
	