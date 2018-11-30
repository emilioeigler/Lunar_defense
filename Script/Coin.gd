tool #para ver la animacion

extends Node2D
var valor = 0
var timer = 0
var timer_vida = 0
func _ready():
	pass # Replace with function body.

func _process(delta):
	timer += 0.15
	timer_vida += 1
	if timer>=1:
		$Coin_Area2D/Sprite.frame += 1
		timer=0
	if $Coin_Area2D/Sprite.frame ==5:
		$Coin_Area2D/Sprite.frame = 0
	if timer_vida >= 1800:
		$Coin_Area2D/Sprite.modulate.a -= 0.005
	if timer_vida == 2000:
		queue_free()



func _on_Tween_tween_completed(object, key):
	get_node("../GUI/Score").text =str( float(get_node("../GUI/Score").text) + valor)
	queue_free()

