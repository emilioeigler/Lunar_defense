extends KinematicBody2D

var vida

func _process(delta):
	#Valores de vida de enemy
	vida = get_node("../../..").vidas

#funcion hit llama a funcion vida() de enemy
func hit():
	get_node("../../..").vida()
	
#funcion morir llama a morir de enemy
func _morir():
	get_node("../../..")._morir()