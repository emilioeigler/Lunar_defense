extends Node2D

func _ready():
	#sonido play
	$Sound.play()

#escala sprite lost base 
func _process(delta):
	$Spr_message.scale += Vector2(0.001,0.001)
	if $Spr_message.scale.x >= 1.299:
		$Spr_message.scale = Vector2(1,1)
		queue_free()
	pass


