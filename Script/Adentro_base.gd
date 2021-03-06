extends Area2D

export(PackedScene) var message
var energy_base = 3
var timer = 0


func _process(delta):
	#actualiza energia base
	if energy_base == 3:
		$Energia_base.texture = load("res://Art/energia_base3.png")
	if energy_base == 2:
		$Energia_base.texture = load("res://Art/energia_base2.png")
	if energy_base == 1:
		$Energia_base.texture = load("res://Art/energia_base1.png")
	if energy_base == 0:
		$Energia_base.texture = load("res://Art/energia_base0.png")
	#si no hay mas energia...
	if energy_base <= 0:
		timer += 1
	if timer == 1:
		var message_instance = message.instance()
		message_instance.get_node("Spr_message").texture = load("res://Art/lost_base.png")
		get_parent().add_child(message_instance)
	# en el timer 300 cambiar escena a menu
	if timer == 300:
		get_tree().change_scene("res://Scenes/Game.tscn")
	pass

#señal : cuando un body entra al area
func _on_Adentro_base_body_entered(body):
	if body.is_in_group("enemy"):
		energy_base -=1
		$vida_base.play()
		get_node("../").cant_enemy -= 1
		body._morir()
	pass # Replace with function body.

