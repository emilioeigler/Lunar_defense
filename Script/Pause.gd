extends Node

func _ready():
	#el sprite se vuelve visible
	$Sprite.visible = false
	
func _process(delta):
	#si se presiona "pausa"
	if Input.is_action_just_pressed("pausa"):
		#si no esta pausado se pausa
		if get_tree().paused == false:
			get_tree().paused = true
			$Sprite.visible = true
		else:
			get_tree().paused = false
			$Sprite.visible = false
	#si se presiona esc vuelve a menu
	if Input.is_action_just_pressed("esc"):
		get_tree().is_queued_for_deletion()
		get_tree().change_scene("res://Scenes/Game.tscn")

