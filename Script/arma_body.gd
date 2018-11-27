extends KinematicBody2D

var vida

func _process(delta):
	
	vida = get_node("../").vidas
	
func hit():
	get_node("../").vida()
	
func _morir():
	get_node("../")._morir()