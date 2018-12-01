extends Node2D

export(PackedScene) var Bala

var vida_enemy = 0
var vidas = 100
var vectorDirection
var timer = 0
var disparar = 0
var enemy_target = null
var lista_enemy = []
var timer_bala = 0
var area


func _ready():
	$Nuevo.play()
	

func _physics_process(delta):
	if vidas <= 0:
		timer += 1
		disparar = 0
		$arma_body/CollisionShape2D.disabled = true
		$arma02.texture = load("res://Art/arma02_gris.png")
	if timer == 1:
		$Morir.play()
	if timer >= 500:
		$arma02.modulate.a -= 0.005
	if timer == 700:
		area.ocupada = false
		morir()
	
	if lista_enemy:
		enemy_target = lista_enemy[0]
	if disparar <= 0:
		disparar = 0
		enemy_target = null
	if enemy_target:
		vida_enemy = enemy_target.vida
	if vida_enemy == 0:
		enemy_target = null
		
	timer_bala+=1
	
	if disparar > 0:
		if enemy_target:
			look_at(enemy_target.global_position)
			if timer_bala==10 || timer_bala==24 || timer_bala==38:
				var bala_instance = Bala.instance()
				bala_instance.pos = -1 *(global_position - $Arma_derecha.global_position)
				vectorDirection = -1 * (global_position - enemy_target.global_position)
				bala_instance.dir = vectorDirection
				get_parent().add_child(bala_instance)
			if timer_bala==17 || timer_bala==31 || timer_bala==45:
				var bala_instance = Bala.instance()
				bala_instance.pos = -1 * (global_position - $Arma_izquierda.global_position)
				vectorDirection = -1 * (global_position - enemy_target.global_position)
				bala_instance.dir = vectorDirection
				get_parent().add_child(bala_instance)
				
	if timer_bala>100:
		timer_bala = 0	
	pass

func vida():
	vidas -= 3
	
func morir():
	queue_free()
	
func _on_Area2D_body_entered(body):
	if body.is_in_group("enemy"):
		disparar += 1	
		lista_enemy.append(body)

func _on_Area2D_body_exited(body):
	if body.is_in_group("enemy"):
		disparar -= 1
		var nodo = lista_enemy.find(body)
		lista_enemy.remove(nodo)