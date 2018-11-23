extends Node2D

var posision = 0.0
export var speed =  0.5
var vida = 100

onready var follow = get_node("Path2D/PathFollow2D")

func _ready():
	get_node("Path2D/PathFollow2D/ProgressBar").value = vida
	pass 


func _process(delta):
	follow.offset += speed
	pass
	
func vida():
	vida -= 1
	get_node("Path2D/PathFollow2D/ProgressBar").value = vida
	if vida == 0:
		queue_free()
