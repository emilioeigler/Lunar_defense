extends Node2D

export(PackedScene) var Coin

export var speed =  0.2
var vidas = 100
var timer = 0
var vivo = true

#para seguir el pathfollow2d
onready var follow = get_node("Path2D/PathFollow2D")

func _ready():
	#barra de vida
	get_node("Path2D/PathFollow2D/ProgressBar").value = vidas
	pass 


func _process(delta):
	#actualiza vida
	get_node("Path2D/PathFollow2D/ProgressBar").value = vidas
	follow.offset += speed
	if vidas <= 0:
		timer += 1
	if timer == 1:
		#sonido morir
		$Morir.play()
	if timer >= 500:
		$Path2D/PathFollow2D/Sprite.modulate.a -= 0.005
	if timer == 700:
		_morir()
	pass
	
func vida():
	#descuenta vida
	vidas -= 1
	#cambia sprite a charco, oculta barra energia, elimina el kinematicbody, cantenemy - 1, crea una moneda
	if vidas <= 0 and vivo:
		vivo=false
		z_index = 0
		get_node("Path2D/PathFollow2D/Sprite").texture = load("res://Art/charco.png")
		get_node("Path2D/PathFollow2D/Sprite").scale = Vector2(1,1)
		get_node("Path2D/PathFollow2D/ProgressBar").hide()
		get_node("Path2D/PathFollow2D/KinematicBody2D").queue_free()
		speed = 0
		get_node("../").cant_enemy -= 1
		var coin_instance = Coin.instance()
		coin_instance.position = get_node("Path2D/PathFollow2D/Sprite").global_position
		coin_instance.valor = 40
		get_parent().add_child(coin_instance)
func _morir():
	queue_free()