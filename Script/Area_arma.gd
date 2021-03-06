extends Area2D
export(PackedScene) var scene_arma
export(PackedScene) var scene_arma2
export(PackedScene) var scene_arma3

var arma
var arma2
var arma3
var ocupada = false #si ya esta ocupada por un arma
export var habilitada = false #area habilitada o no


func _process(delta):
	if !habilitada: #si no esta habilitada usar textura...
		$Sprite.texture = load("res://Art/area_arma_no.png")
	else: #si esta habilitada usar textura...
		$Sprite.texture = load("res://Art/area_arma.png")

#funcion habilitar area_arma
func habilitar_area_arma():
	habilitada = true
	

func _input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
        self.on_click()

func on_click():
	#si el area esta habilitada
	if habilitada:
		#si el slot01 esta seleccionado y el area no ocupada agregar arma 01
		if get_node("../GUI/Slot01").seleccion == true and !ocupada:
			get_node("../GUI/Slot01").seleccion = false
			arma = scene_arma.instance()
			arma.position.y -= 10
			get_node("../GUI/Score").text =str( float(get_node("../GUI/Score").text) - 50)
			arma.area = self
			add_child (arma)
			ocupada = true
		#si el slot02 esta seleccionado y el area no ocupada agregar arma 02	
		if get_node("../GUI/Slot02").seleccion == true and !ocupada:
			get_node("../GUI/Slot02").seleccion = false
			arma2 = scene_arma2.instance()
			arma2.position.y -= 10
			get_node("../GUI/Score").text =str( float(get_node("../GUI/Score").text) - 150)
			arma2.area = self
			add_child (arma2)
			ocupada = true
		#si el slot03 esta seleccionado y el area no ocupada agregar arma 03	
		if get_node("../GUI/Slot03").seleccion == true and !ocupada:
			get_node("../GUI/Slot03").seleccion = false
			arma3 = scene_arma3.instance()
			arma3.position.y -= 10
			get_node("../GUI/Score").text =str( float(get_node("../GUI/Score").text) - 400)
			arma3.area = self
			add_child (arma3)
			ocupada = true
	#si el area no esta habilitada
	else:
		#si el slot04 esta seleccionado y el area no ocupada habilitar area
		if get_node("../GUI/Slot04").seleccion == true and !ocupada:
			get_node("../GUI/Slot04").seleccion = false
			habilitada = true
			get_node("../GUI/Score").text =str( float(get_node("../GUI/Score").text) - 500)
			ocupada = false
			$Sound.play()
	
	