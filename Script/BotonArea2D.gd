extends Area2D

#si se cliquea sobre el area llama a on_click
func _input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
        self.on_click()

func on_click():
	#cambia sprite de boton
	$Sprite.texture = load ("res://Art/boton_play_press.png")
	#llama a alien_ship.atack()
	get_node("../alien_ship")._attack()
	#sonidos
	$Click.play()
	$Ship.play()
	#llama funcion fade_out
	get_node("../").fade_out()
	
