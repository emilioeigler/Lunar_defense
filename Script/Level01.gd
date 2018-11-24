extends Node2D

onready var follow = get_node("Path2D")
export (PackedScene) var Enemy_01
export (PackedScene) var Bala

var enemigo01 
var enemigo02 
var enemigo03 
var enemigo04 
var enemigo05 
var enemigo06 
var enemigo07



var bala

var timer = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	timer += 1
	if timer == 150:
		_nuevo_enemigo(enemigo01)
		
	if Input.is_action_pressed('ui_accept'):
		bala = Bala.instance()
		bala.pos = Vector2 (500,170)
		bala.dir = Vector2(-1,0)
		add_child(bala)
		
	if timer == 350:
		_nuevo_enemigo(enemigo02)
	if timer == 650:
		_nuevo_enemigo(enemigo03)
	if timer == 900:
		_nuevo_enemigo(enemigo04)
	if timer == 1250:
		_nuevo_enemigo(enemigo05)
	
	pass
	
func _nuevo_enemigo(name):
	name = Enemy_01.instance()
	name.get_node("Path2D").curve = follow.curve 
	add_child (name)
	

	
	
	
	
