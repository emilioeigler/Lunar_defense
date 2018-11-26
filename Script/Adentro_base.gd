extends Area2D

var energy_base = 3

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
	pass


func _on_Adentro_base_body_entered(body):
	if body.is_in_group("enemy"):
		energy_base -=1
		body._morir()
	pass # Replace with function body.
