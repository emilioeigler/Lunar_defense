extends KinematicBody2D

var vida

func _process(delta):
	
	vida = get_node("../../..").vida
	
func hit():
	get_node("../../..").vida()
	
	