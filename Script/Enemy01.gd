extends Node2D

export(PackedScene) var Coin

export var speed =  0.2
var vidas = 100
var timer = 0
var vivo = true
var escudo = false

#para seguir el pathfollow2d
onready var follow = get_node("Path2D/PathFollow2D")

func _ready():
	#barra de vida
	get_node("Path2D/PathFollow2D/ProgressBar").value = vidas
	pass 

func _process(delta):
	#si vida es menor o igual que 0 y esta vivo
	if vidas <= 0 and vivo:
		#cambia sprite a charco, oculta barra energia, elimina el kinematicbody, cantenemy - 1, crea una moneda
		vivo=false
		z_index = 0
		get_node("Path2D/PathFollow2D/Sprite").texture = load("res://Art/charco.png")
		get_node("Path2D/PathFollow2D/Sprite").scale = Vector2(1,1)
		get_node("Path2D/PathFollow2D/ProgressBar").hide()
		get_node("Path2D/PathFollow2D/KinematicBody2D").queue_free()
		get_node("../").cant_enemy -= 1
		speed = 0
		var coin_instance = Coin.instance()
		coin_instance.position = get_node("Path2D/PathFollow2D/Sprite").global_position
		coin_instance.valor = 25
		get_parent().add_child(coin_instance)
	#actualiza vida
	get_node("Path2D/PathFollow2D/ProgressBar").value = vidas
	follow.offset += speed
	#si no tiene escudo y vida es mayor que 0 cambiar textura
	if !escudo and vidas>0:
		get_node("Path2D/PathFollow2D/Sprite").texture = load("res://Art/enemy01.png")
	if vidas <= 0:
		timer += 1
	if timer == 1:
		#sonido morir
		$Morir.play()
	if timer >= 500:
		#modula alpha
		$Path2D/PathFollow2D/Sprite.modulate.a -= 0.005
	if timer == 700:
		_morir()
	#si tiene escudo cambiar textura
	if escudo:
		get_node("Path2D/PathFollow2D/Sprite").texture = load("res://Art/enemy01_escudo.png")
		if vidas <= 50:
			escudo = false

#funcion vida, descuenta segun si tiene o no escudo
func vida():
	if !escudo:
		vidas -= 3.5
	if escudo:
		vidas -= 1.5

#funcion morir
func _morir():
	queue_free()

