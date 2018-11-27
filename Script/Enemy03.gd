extends Node2D

export(PackedScene) var Bala

export var speed =  0.2
var vidas = 100
var timer = 0
var timer_bala = 0
var vivo = true
var escudo = false
var disparar = 0
var arma_target = null
var lista_arma = []
var vida_arma = 0
var vectorDirection
var vectorPosition

onready var follow = get_node("Path2D/PathFollow2D")

func _ready():
	get_node("Path2D/PathFollow2D/ProgressBar").value = vidas
	pass 


func _process(delta):
	get_node("Path2D/PathFollow2D/ProgressBar").value = vidas
	follow.offset += speed
	if !escudo and vidas>0:
		get_node("Path2D/PathFollow2D/Sprite").texture = load("res://Art/enemy03.png")
	if vidas <= 0:
		timer += 1
		disparar = 0
	if timer >= 500:
		$Path2D/PathFollow2D/Sprite.modulate.a -= 0.005
	if timer == 700:
		_morir()
	if escudo:
		get_node("Path2D/PathFollow2D/Sprite").texture = load("res://Art/enemy03_escudo.png")
		if vidas <= 50:
			escudo = false
	
	if lista_arma:
		arma_target = lista_arma[0]
	if disparar <= 0:
		disparar = 0
		arma_target = null
	if arma_target:
		vida_arma = arma_target.vida
	if vida_arma <= 0:
		lista_arma.pop_front()
		
		
	timer_bala+=1
	if disparar > 0:
		if arma_target:
			
			if timer_bala==10 || timer_bala==17 || timer_bala==24:
				var bala_instance = Bala.instance()
				vectorPosition = $Path2D/PathFollow2D/Sprite.global_position
				bala_instance.pos = vectorPosition
				vectorDirection = -1 * ($Path2D/PathFollow2D/Sprite.global_position - arma_target.global_position)
				bala_instance.dir = vectorDirection
				
				get_parent().add_child(bala_instance)
	if timer_bala>100:
		timer_bala = 0
	pass
	
func vida():
	if !escudo:
		vidas -= 3.5
	if escudo:
		vidas -= 1.5
	
	if vidas <= 0 and vivo:
		vivo=false
		get_node("../GUI/Score").text =str( float(get_node("../GUI/Score").text) + 25)
		z_index = 0
		get_node("Path2D/PathFollow2D/Sprite").texture = load("res://Art/charco.png")
		get_node("Path2D/PathFollow2D/Sprite").scale = Vector2(1,1)
		get_node("Path2D/PathFollow2D/ProgressBar").hide()
		get_node("Path2D/PathFollow2D/KinematicBody2D").queue_free()
		speed = 0
		
	
func _morir():
	queue_free()

func _on_AreaEnemy03_body_entered(body):
	if body.is_in_group("arma"):
		disparar += 1	
		lista_arma.append(body)		
	pass # Replace with function body.


func _on_AreaEnemy03_body_exited(body):
	if body.is_in_group("arma"):
		disparar -= 1
		var nodo = lista_arma.find(body)
		lista_arma.remove(nodo)
	pass # Replace with function body.
