extends Node2D

export(PackedScene) var Bala

var vida_enemy = 0
var vectorDirection
var vectorPosition
var timer = 0
var disparar = 0
var enemy_target = null
var lista_enemy = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if lista_enemy:
		enemy_target = lista_enemy[0]
	if disparar <= 0:
		disparar = 0
		enemy_target = null
	if enemy_target:
		vida_enemy = enemy_target.vida
	if vida_enemy == 0:
		enemy_target = null
		
	timer+=1
	
	if disparar > 0:
		if enemy_target:
			look_at(enemy_target.global_position)
			if timer==10 || timer==24 || timer==38:
				var bala_instance = Bala.instance()
				bala_instance.pos = -1 *(global_position - $Arma_derecha.global_position)
				vectorDirection = -1 * (global_position - enemy_target.global_position)
				bala_instance.dir = vectorDirection
				get_parent().add_child(bala_instance)
			if timer==17 || timer==31 || timer==45:
				var bala_instance = Bala.instance()
				bala_instance.pos = -1 * (global_position - $Arma_izquierda.global_position)
				vectorDirection = -1 * (global_position - enemy_target.global_position)
				bala_instance.dir = vectorDirection
				get_parent().add_child(bala_instance)
				
	print($Arma_derecha.position)
	if timer>100:
		timer = 0	
	pass
	
func _on_Area2D_body_entered(body):
	if body.is_in_group("enemy"):
		disparar += 1	
		lista_enemy.append(body)		
	pass # Replace with function body.

func _on_Area2D_body_exited(body):
	if body.is_in_group("enemy"):
		disparar -= 1
		var nodo = lista_enemy.find(body)
		lista_enemy.remove(nodo)
	pass # Replace with function bod