extends Node


func _ready():
	$Sprite.visible = false
	
func _process(delta):
	if Input.is_action_just_pressed("pausa"):
		if get_tree().paused == false:
			get_tree().paused = true
			$Sprite.visible = true
		else:
			get_tree().paused = false
			$Sprite.visible = false
	if Input.is_action_just_pressed("esc"):
		get_tree().is_queued_for_deletion()
		get_tree().change_scene("res://Scenes/Game.tscn")
