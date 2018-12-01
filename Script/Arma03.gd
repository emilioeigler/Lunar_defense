extends Node2D

var timer = 0
var enemy_target = null
var lista_enemy = []
var area
var cant_enemy

func _physics_process(delta):
	timer +=1
	#anima los sprites
	$AnimatedSprite.playing = true
	#mide lista de enemigos
	cant_enemy = lista_enemy.size()
	if timer==60:
		#si hay algo en la lista
		if cant_enemy > -1 :
			#sonido explosion
			$Explosion.play()
			#quita vida a todos los de la lista dependiendo del grupo
			for i in range (cant_enemy):
				if lista_enemy[i].get_node("../../..").is_in_group("enemy"):
					lista_enemy[i].get_node("../../..").vidas -= 45
					lista_enemy[i].get_node("../../..").vida()
				if lista_enemy[i].get_node("../../..").is_in_group("enemy2"):
					lista_enemy[i].get_node("../../..").vidas -= 20
					lista_enemy[i].get_node("../../..").vida()
	if timer >100:
		morir()
func morir():
	area.ocupada = false
	queue_free()
	
func _on_Area2D_body_entered(body):
	if body.is_in_group("enemy"):
		lista_enemy.append(body)		


func _on_Area2D_body_exited(body):
	if body.is_in_group("enemy"):
		var nodo = lista_enemy.find(body)
		lista_enemy.remove(nodo)
		

