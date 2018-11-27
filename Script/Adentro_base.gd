extends Area2D

export(PackedScene) var lost_base
var energy_base = 3
var timer = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if energy_base == 3:
		$Energia_base.texture = load("res://Art/energia_base3.png")
	if energy_base == 2:
		$Energia_base.texture = load("res://Art/energia_base2.png")
	if energy_base == 1:
		$Energia_base.texture = load("res://Art/energia_base1.png")
	if energy_base == 0:
		$Energia_base.texture = load("res://Art/energia_base0.png")
	if energy_base <= 0:
		timer += 1
	if timer == 1:
		var lost_base_instance = lost_base.instance()
		get_parent().add_child(lost_base_instance)
	if timer == 300:
		get_tree().change_scene("res://Scenes/Game.tscn")
	pass


func _on_Adentro_base_body_entered(body):
	if body.is_in_group("enemy"):
		energy_base -=1
		body._morir()
	pass # Replace with function body.
