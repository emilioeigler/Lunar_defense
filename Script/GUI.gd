extends Node2D

var activo = false
var activo2 = false
var activo3 = false
var activo4 = false
var score

#determina si los sprites estan en color o en gris, activos o no
func _process(delta):
	score = float($Score.text)
	
	if float($Score.text)>=float($Label.text):
		$Slot01/Slot01.texture = load("res://Art/arma01.png")
		activo = true
	else:
		$Slot01/Slot01.texture = load("res://Art/arma01_gris.png")
		activo = false
	
	if float($Score.text)>=float($Label2.text):
		$Slot02/Slot02.texture = load("res://Art/arma02.png")
		activo2 = true
	else:
		$Slot02/Slot02.texture = load("res://Art/arma02_gris.png")
		activo2 = false
	
	if float($Score.text)>=float($Label3.text):
		$Slot03/Slot03.texture = load("res://Art/arma03.png")
		activo3 = true
	else:
		$Slot03/Slot03.texture = load("res://Art/arma03_gris.png")
		activo3 = false
		
	if float($Score.text)>=float(500):
		$Slot04/area_arma.texture = load("res://Art/area_arma.png")
		activo4 = true
	else:
		$Slot04/area_arma.texture = load("res://Art/area_arma_no.png")
		activo4 = false
	pass

