extends Node2D

var posision = 0.0
export var speed =  0.5
var vida = 100
var timer = 0
var vivo = true

onready var follow = get_node("Path2D/PathFollow2D")

func _ready():
	get_node("Path2D/PathFollow2D/ProgressBar").value = vida
	pass 


func _process(delta):
	follow.offset += speed
	if vida == 0:
		timer += 1
	if timer >= 500:
		$Path2D/PathFollow2D/Sprite.modulate.a -= 0.005
	if timer == 700:
		_morir()
	pass
	
func vida():
	vida -= 5
	get_node("Path2D/PathFollow2D/ProgressBar").value = vida
	if vida == 0 and vivo:
		vivo=false
		get_node("../GUI/Score").text =str( float(get_node("../GUI/Score").text) + 25)
		get_node("Path2D/PathFollow2D/Sprite").texture = load("res://Art/charco.png")
		get_node("Path2D/PathFollow2D/Sprite").scale = Vector2(1,1)
		get_node("Path2D/PathFollow2D/ProgressBar").hide()
		get_node("Path2D/PathFollow2D/KinematicBody2D").queue_free()
		speed = 0
		
func _morir():
	queue_free()
