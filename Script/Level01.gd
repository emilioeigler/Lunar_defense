extends Node2D

onready var follow = get_node("Path2D")
export (PackedScene) var Enemy_01


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
	if timer == 1650:
		_nuevo_enemigo(enemigo01)
	if timer == 1800:
		_nuevo_enemigo(enemigo01)
	if timer == 1870:
		_nuevo_enemigo(enemigo01)
	if timer == 1920:
		_nuevo_enemigo(enemigo01)
	if timer == 2000:
		_nuevo_enemigo(enemigo01)
	if timer == 2100:
		_nuevo_enemigo(enemigo01)
	if timer == 2200:
		_nuevo_enemigo(enemigo01)
	if timer == 2500:
		_nuevo_enemigo(enemigo01)
	if timer == 6600:
		_nuevo_enemigo(enemigo01)
	if timer == 6650:
		_nuevo_enemigo(enemigo01)
	if timer == 6800:
		_nuevo_enemigo(enemigo01)
	if timer == 6870:
		_nuevo_enemigo(enemigo01)
	if timer == 6920:
		_nuevo_enemigo(enemigo01)
	if timer == 7000:
		_nuevo_enemigo(enemigo01)
	if timer == 7100:
		_nuevo_enemigo(enemigo01)
	if timer == 7200:
		_nuevo_enemigo(enemigo01)
		timer = 0
	pass

func _nuevo_enemigo(name):
	name = Enemy_01.instance()
	name.get_node("Path2D").curve = follow.curve 
	add_child (name)
	

	

	
	
	
	
