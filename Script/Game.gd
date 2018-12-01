extends Node2D

var fade = false

func _ready():
	#comienza la musica con el juego
	$Music.play()
	
func _process(delta):
	#si fade true bajar volume db
	if fade:
		$Music.volume_db -= 0.2 

#funcion bajar volume db
func fade_out():
	if fade:
		fade = false
	else:
		fade = true

