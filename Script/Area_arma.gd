extends Area2D
#export (PackedScene) var Arma2_nodo
#export (PackedScene) var Arma_nodo

var scene_arma = load("res://Scenes/Arma01.tscn")
var scene_arma2 = load("res://Scenes/Arma02.tscn")
var arma
var arma2
var ocupada = false

func _input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
        self.on_click()

func on_click():
	if get_node("../GUI/Slot01").seleccion == true and !ocupada:
		get_node("../GUI/Slot01").seleccion = false
		arma = scene_arma.instance()
		arma.position.y -= 10
		get_node("../GUI/Score").text =str( float(get_node("../GUI/Score").text) - 50)
		add_child (arma)
		ocupada = true
		
	if get_node("../GUI/Slot02").seleccion == true and !ocupada:
		get_node("../GUI/Slot02").seleccion = false
		arma2 = scene_arma2.instance()
		arma2.position.y -= 10
		get_node("../GUI/Score").text =str( float(get_node("../GUI/Score").text) - 100)
		add_child (arma2)
		ocupada = true
	