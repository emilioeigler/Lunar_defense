extends Node2D

var timer = 0
var enemy_target = null
var lista_enemy = []
var area
var cant_enemy


# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

func _physics_process(delta):
	timer +=1
	$AnimatedSprite.playing = true
	cant_enemy = lista_enemy.size()
	if timer==60:
		
		if cant_enemy > -1 :
			for i in range (cant_enemy):
				lista_enemy[i].get_node("../../..").vidas -= 50
	if timer >100:
		morir()
func morir():
	area.ocupada = false
	queue_free()
	
func _on_Area2D_body_entered(body):
	if body.is_in_group("enemy"):
		lista_enemy.append(body)		
	pass 
