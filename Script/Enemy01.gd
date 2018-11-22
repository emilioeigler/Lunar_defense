extends Node2D

var posision = 0.0
export var speed =  1

#onready var follow = get_node("Path2D/follow")
onready var follow = get_node("Path2D/PathFollow2D")



func _ready():
	pass 


func _process(delta):
	follow.offset += speed
	pass
