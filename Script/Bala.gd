extends KinematicBody2D


export(float) var BULLET_VELOCITY = 300

var dir = Vector2()
var pos = Vector2()
var motion = Vector2(1, 0)
func _ready():
	position = pos
	$shoot.play()

func _physics_process(delta):
	
	motion = dir.normalized() * BULLET_VELOCITY * delta
	var collision = move_and_collide(motion)
	#si colisiona con el grupo enemy o enemy2
	if (collision):
		if (collision.collider.is_in_group("enemy")):
			collision.collider.hit()
			get_parent().remove_child(self)
		if (collision.collider.is_in_group("enemy2")):
			collision.collider.hit()
			get_parent().remove_child(self)

#si sale de la pantalla liberar
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

