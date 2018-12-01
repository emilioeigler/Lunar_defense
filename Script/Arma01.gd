extends Node2D

export(PackedScene) var Bala

var vida_enemy = 0
var vidas = 100
var vectorDirection
var vectorPosition
var timer = 0
var disparar = 0
var enemy_target = null
var lista_enemy = []
var timer_bala = 0
var area


func _ready():
	#emitir sonido
	$Nuevo.play()
	pass 

func _physics_process(delta):
	#si vida es menor o igual  que 0 cambia sprite
	if vidas <= 0:
		timer += 1
		disparar = 0
		$arma_body/CollisionShape2D.disabled = true
		$arma01.texture = load("res://Art/arma01_gris.png")
	if timer == 1:
		#sonido morir
		$Morir.play()
	
	if timer >= 500:
		#modula alpha a 0
		$arma01.modulate.a -= 0.005
	if timer == 700:
		#desocupa el area
		area.ocupada = false
		#llama a funcion morir
		morir()
	#si hay algo en listaenemy
	if lista_enemy:
		#copia el primer elemento
		enemy_target = lista_enemy[0]
		
	if disparar <= 0:
		disparar = 0
		enemy_target = null
		
	if enemy_target:
		vida_enemy = enemy_target.vida
	if vida_enemy == 0:
		enemy_target = null
		
	#instancia bala con timer
	timer_bala+=1
	if vidas >=0:
		if disparar > 0:
			if enemy_target:
				look_at(enemy_target.global_position)
				if timer_bala==10 || timer_bala==17 || timer_bala==24:
					var bala_instance = Bala.instance()
					vectorPosition = position
					bala_instance.pos = vectorPosition
					bala_instance.get_collision_exceptions()
					vectorDirection = -1 * (global_position - enemy_target.global_position)
					bala_instance.dir = vectorDirection
					get_parent().add_child(bala_instance)
	
	if timer_bala>100:
		timer_bala = 0	
	pass
	
func vida():
	vidas -= 5
	
func morir():
	queue_free()
	
#señal enemigo entra en area
func _on_Area2D_body_entered(body):
	if body.is_in_group("enemy"):
		disparar += 1	
		lista_enemy.append(body)		
	pass 
#señal enemigo sale en area
func _on_Area2D_body_exited(body):
	if body.is_in_group("enemy"):
		disparar -= 1
		var nodo = lista_enemy.find(body)
		lista_enemy.remove(nodo)
	pass 

