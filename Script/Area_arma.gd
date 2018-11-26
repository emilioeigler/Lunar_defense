extends Area2D

var scene_arma = load("res://Scenes/Arma01.tscn")
var scene_arma2 = load("res://Scenes/Arma02.tscn")
var arma
var arma2
var ocupada = false
export var habilitada = false


func _process(delta):
	if !habilitada:
		$Sprite.texture = load("res://Art/area_arma_no.png")
	else:
		$Sprite.texture = load("res://Art/area_arma.png")

func habilitar_area_arma():
	habilitada = true
	
func _input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
        self.on_click()

func on_click():
	if habilitada:
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
	else:
		if get_node("../GUI/Slot04").seleccion == true and !ocupada:
			get_node("../GUI/Slot04").seleccion = false
			habilitada = true
			get_node("../GUI/Score").text =str( float(get_node("../GUI/Score").text) - 200)
			ocupada = false
	