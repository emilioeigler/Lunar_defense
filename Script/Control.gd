extends Node2D

func _ready():
	self.pause_mode = Node.PAUSE_MODE_PROCESS
	
func _process(delta):
	if $Pausa.pausa == true:
		get_tree().paused = true
		
	else:
		get_tree().paused = false
	
	
