extends Sprite
#acomoda la posicion de la cara del alien segun la oleada
func _process(delta):
	if get_node("../../").oleada_numero == 0:
		visible = false
	if get_node("../../").oleada_numero == 1:
		visible = true
		position = get_node("../01").position
	if get_node("../../").oleada_numero == 2:
		visible = true
		position = get_node("../02").position
	if get_node("../../").oleada_numero == 3:
		visible = true
		position = get_node("../03").position
	if get_node("../../").oleada_numero == 4:
		visible = true
		position = get_node("../04").position
	if get_node("../../").oleada_numero == 5:
		visible = true
		position = get_node("../05").position
	if get_node("../../").oleada_numero == 6:
		visible = true
		position = get_node("../06").position
	if get_node("../../").oleada_numero == 7:
		visible = true
		position = get_node("../07").position
	if get_node("../../").oleada_numero == 8:
		visible = true
		position = get_node("../08").position
	if get_node("../../").oleada_numero == 9:
		visible = true
		position = get_node("../09").position
	if get_node("../../").oleada_numero == 10:
		visible = true
		position = get_node("../10").position
