extends KinematicBody2D


export(float) var BULLET_VELOCITY = 300

var dir = Vector2()
var pos = Vector2()
var motion = Vector2(1, 0)
func _ready():
	position = pos
	$Shoot.play()

func _physics_process(delta):

	motion = dir.normalized() * BULLET_VELOCITY * delta
	var collision = move_and_collide(motion)
	get_collision_exceptions()
	#si colisiona con el grupo arma llama a hit y se borra
	if (collision):
		if (collision.collider.is_in_group("arma")):
			collision.collider.hit()
		
		get_parent().remove_child(self)
		
#si sale de pantalla se borra
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

