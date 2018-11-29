extends Node2D

export(PackedScene) var message

onready var follow = get_node("Path2D")
export (PackedScene) var Enemy_01
export (PackedScene) var Enemy_02
export (PackedScene) var Enemy_03

var enemigo
var cant_enemy = 0
var timer = 0
var oleada_numero = 0


func _ready():
	pass # Replace with function body.

func _process(delta):
	if cant_enemy==0:
		oleada_numero += 1
		timer = 0
		if oleada_numero == 1:
			cant_enemy = 8
		if oleada_numero == 2:
			cant_enemy = 15
		if oleada_numero == 3:
			cant_enemy = 33
		if oleada_numero == 4:
			cant_enemy = 35
	
	if oleada_numero == 1 :
		oleada_01()
	if oleada_numero == 2 :
		oleada_02()
	if oleada_numero == 3 :
		oleada_03()
	if oleada_numero == 4 :
		oleada_04()
	pass

func _nuevo_enemigo(name,escudo):
	name = Enemy_01.instance()
	name.get_node("Path2D").curve = follow.curve 
	if escudo:
		name.escudo = true
	else:
		name.escudo = false
	add_child (name)
	
func _nuevo_enemigo2(name):
	name = Enemy_02.instance()
	name.get_node("Path2D").curve = follow.curve 
	add_child (name)
	
func _nuevo_enemigo3(name):
	name = Enemy_03.instance()
	name.get_node("Path2D").curve = follow.curve 
	add_child (name)
	
	
func oleada_01():
	timer += 1
	if timer == 1:
		if $Adentro_base.energy_base > 0:
			var message_instance = message.instance()
			message_instance.get_node("Spr_message").texture = load("res://Art/wave_01.png")
			get_parent().add_child(message_instance)
	
	if timer == 150: _nuevo_enemigo(enemigo,false)
	if timer == 350: _nuevo_enemigo(enemigo,false)
	if timer == 650: _nuevo_enemigo(enemigo,false)
	if timer == 900: _nuevo_enemigo(enemigo,false)
	if timer == 1250: _nuevo_enemigo(enemigo,false)
	if timer == 1450: _nuevo_enemigo(enemigo,false)
	if timer == 1650: _nuevo_enemigo(enemigo,false)
	if timer == 1800: _nuevo_enemigo(enemigo,false)
		
func oleada_02():
	timer += 1
	if timer == 1:
		if $Adentro_base.energy_base > 0:
			var message_instance = message.instance()
			message_instance.get_node("Spr_message").texture = load("res://Art/wave_02.png")
			get_parent().add_child(message_instance)
			
	if timer == 150: _nuevo_enemigo(enemigo,false)
	if timer == 350: _nuevo_enemigo(enemigo,false)
	if timer == 650: _nuevo_enemigo(enemigo,false)
	if timer == 720: _nuevo_enemigo(enemigo,false)
	if timer == 820: _nuevo_enemigo(enemigo,false)
	if timer == 900: _nuevo_enemigo(enemigo,false)
	if timer == 1100: _nuevo_enemigo(enemigo,false)
	if timer == 1250: _nuevo_enemigo(enemigo,false)
	if timer == 1350: _nuevo_enemigo(enemigo,false)
	if timer == 1420: _nuevo_enemigo(enemigo,false)
	if timer == 1500: _nuevo_enemigo(enemigo,false)
	if timer == 1620: _nuevo_enemigo(enemigo,false)
	if timer == 1800: _nuevo_enemigo(enemigo,false)
	if timer == 2000: _nuevo_enemigo(enemigo,false)
	if timer == 2200: _nuevo_enemigo2(enemigo)
	
		
func oleada_03():
	timer += 1
	if timer == 1:
		if $Adentro_base.energy_base > 0:
			var message_instance = message.instance()
			message_instance.get_node("Spr_message").texture = load("res://Art/wave_03.png")
			get_parent().add_child(message_instance)
	if timer == 150: _nuevo_enemigo(enemigo,false)
	if timer == 350: _nuevo_enemigo(enemigo,false)
	if timer == 650: _nuevo_enemigo(enemigo,false)
	if timer == 900: _nuevo_enemigo(enemigo,false)
	if timer == 1250: _nuevo_enemigo(enemigo,false)
	if timer == 1500: _nuevo_enemigo(enemigo,true)
	if timer == 1600: _nuevo_enemigo(enemigo,false)
	if timer == 1650: _nuevo_enemigo(enemigo,false)
	if timer == 1800: _nuevo_enemigo(enemigo,false)
	if timer == 1870: _nuevo_enemigo(enemigo,false)
	if timer == 1920: _nuevo_enemigo(enemigo,false)
	if timer == 2000: _nuevo_enemigo(enemigo,false)
	if timer == 2050: _nuevo_enemigo(enemigo,false)
	if timer == 2100: _nuevo_enemigo(enemigo,false)
	if timer == 2130: _nuevo_enemigo(enemigo,false)
	if timer == 2200: _nuevo_enemigo(enemigo,false)
	if timer == 2350: _nuevo_enemigo(enemigo,true)
	if timer == 2420: _nuevo_enemigo(enemigo,false)
	if timer == 2500: _nuevo_enemigo(enemigo,false)
	if timer == 2650: _nuevo_enemigo(enemigo,false)
	if timer == 2800: _nuevo_enemigo(enemigo,true)
	if timer == 3000: _nuevo_enemigo(enemigo,false)
	if timer == 3200: _nuevo_enemigo(enemigo,false)
	if timer == 3350: _nuevo_enemigo(enemigo,false)
	if timer == 3420: _nuevo_enemigo(enemigo,false)
	if timer == 3600: _nuevo_enemigo(enemigo,false)
	if timer == 3650: _nuevo_enemigo(enemigo,false)
	if timer == 3800: _nuevo_enemigo(enemigo,true)
	if timer == 3870: _nuevo_enemigo(enemigo,false)
	if timer == 3920: _nuevo_enemigo(enemigo,false)
	if timer == 4000: _nuevo_enemigo(enemigo,true)
	if timer == 4100: _nuevo_enemigo2(enemigo)
	if timer == 4200: _nuevo_enemigo2(enemigo)
	
func oleada_04():
	timer += 1
	if timer == 1:
		if $Adentro_base.energy_base > 0:
			var message_instance = message.instance()
			message_instance.get_node("Spr_message").texture = load("res://Art/wave_04.png")
			get_parent().add_child(message_instance)
	if timer == 150: _nuevo_enemigo(enemigo,true)
	if timer == 350: _nuevo_enemigo(enemigo,false)
	if timer == 650: _nuevo_enemigo(enemigo,true)
	if timer == 900: _nuevo_enemigo(enemigo,false)
	if timer == 1250: _nuevo_enemigo(enemigo,false)
	if timer == 1500: _nuevo_enemigo(enemigo,true)
	if timer == 1600: _nuevo_enemigo(enemigo,false)
	if timer == 1650: _nuevo_enemigo(enemigo,true)
	if timer == 1800: _nuevo_enemigo(enemigo,false)
	if timer == 1870: _nuevo_enemigo(enemigo,false)
	if timer == 1920: _nuevo_enemigo(enemigo,true)
	if timer == 2000: _nuevo_enemigo(enemigo,false)
	if timer == 2050: _nuevo_enemigo(enemigo,false)
	if timer == 2100: _nuevo_enemigo(enemigo,true)
	if timer == 2130: _nuevo_enemigo(enemigo,false)
	if timer == 2200: _nuevo_enemigo(enemigo,false)
	if timer == 2350: _nuevo_enemigo(enemigo,false)
	if timer == 2420: _nuevo_enemigo(enemigo,true)
	if timer == 2500: _nuevo_enemigo(enemigo,false)
	if timer == 2650: _nuevo_enemigo(enemigo,false)
	if timer == 2800: _nuevo_enemigo(enemigo,true)
	if timer == 3000: _nuevo_enemigo(enemigo,false)
	if timer == 3200: _nuevo_enemigo(enemigo,false)
	if timer == 3350: _nuevo_enemigo(enemigo,true)
	if timer == 3420: _nuevo_enemigo(enemigo,false)
	if timer == 3600: _nuevo_enemigo(enemigo,false)
	if timer == 3650: _nuevo_enemigo(enemigo,false)
	if timer == 3800: _nuevo_enemigo(enemigo,true)
	if timer == 3870: _nuevo_enemigo(enemigo,false)
	if timer == 3920: _nuevo_enemigo(enemigo,false)
	if timer == 4000: _nuevo_enemigo2(enemigo)
	if timer == 4100: _nuevo_enemigo2(enemigo)
	if timer == 4200: _nuevo_enemigo2(enemigo)
