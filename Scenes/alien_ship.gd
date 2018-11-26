extends Sprite

var direccion = true
var attack = false
var timer = 0

func _process(delta):
	#mueve hacia arriba y abajo el sprite
	if direccion :
		if position.y <= 250:
			position.y +=0.3
		else:
			direccion = false
	if !direccion:
		if position.y >= 200:
			position.y -= 0.3
		else:
			direccion = true
	#si attack es true y scale es mayor que 0.1 mover en x y restar scale
	if attack and scale>Vector2(0.01,0.01):
		position.x += 1
		scale -= Vector2(0.01,0.01)
	if attack:
		timer += 1
	if timer >= 150:
		_play_game()
		
#funcion attack
func _attack():
	attack=true
#Carga level01
func _play_game():
	get_tree().change_scene("res://Scenes/Level01.tscn")