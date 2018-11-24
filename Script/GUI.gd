extends Node2D

var activo = false
var activo2 = false
var score
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	score = float($Score.text)
	
	if float($Score.text)>=float($Label.text):
		$Slot01/Slot01.texture = load("res://Art/arma01.png")
		activo = true
	else:
		$Slot01/Slot01.texture = load("res://Art/arma01_gris.png")
		activo = false
	
	if float($Score.text)>=float($Label2.text):
		$Slot02/Slot02.texture = load("res://Art/arma02.png")
		activo2 = true
	else:
		$Slot02/Slot02.texture = load("res://Art/arma02_gris.png")
		activo2 = false
	pass
