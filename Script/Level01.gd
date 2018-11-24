extends Node2D

onready var follow = get_node("Path2D")
export (PackedScene) var Enemy_01
export (PackedScene) var Bala

var enemigo01 

var timer = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	timer += 1
	if timer == 150:
		_nuevo_enemigo(enemigo01)
	if timer == 350:
		_nuevo_enemigo(enemigo01)
	if timer == 650:
		_nuevo_enemigo(enemigo01)
	if timer == 900:
		_nuevo_enemigo(enemigo01)
	if timer == 1250:
		_nuevo_enemigo(enemigo01)
	if timer == 1500:
		_nuevo_enemigo(enemigo01)
	if timer == 1600:
		_nuevo_enemigo(enemigo01)
	
	pass
	
func _nuevo_enemigo(name):
	name = Enemy_01.instance()
	name.get_node("Path2D").curve = follow.curve 
	add_child (name)
	
	

	
	
	
	
