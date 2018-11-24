extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if float($Score.text)>=float($Label.text):
		$Slot01.texture = load("res://Art/arma01.png")
	else:
		$Slot01.texture = load("res://Art/arma01_gris.png")
	pass
