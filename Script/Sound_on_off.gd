extends Node2D
var mute = false

#si se hace click sobre el area
func _input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
        self.on_click()

#bajar sonido a 0
func on_click():
	if mute:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"),false)
		mute = false
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"),true)
		mute = true