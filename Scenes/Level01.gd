extends Node2D

onready var follow = get_node("Path2D")
export (PackedScene) var Enemy_01
var enemigo01 
var enemigo02 
var enemigo03 
var enemigo04 
var enemigo05 
var enemigo06 
var enemigo07
 
var timer = 0

func _ready():
	
	
	pass # Replace with function body.

func _process(delta):
	timer += 1
	if timer == 150:
		_nuevo_enemigo(enemigo01)
	if timer == 350:
		_nuevo_enemigo(enemigo02)
	if timer == 650:
		_nuevo_enemigo(enemigo03)
	if timer == 1000:
		_nuevo_enemigo(enemigo04)
	if timer == 1250:
		_nuevo_enemigo(enemigo05)
	print(timer)
	pass
	
func _nuevo_enemigo(name):
	name = Enemy_01.instance()
	add_child (name)
	name.get_node("Path2D").curve = follow.curve 
	
	
	
	
