extends KinematicBody2D

var speed = 600
var velocity : Vector2

func _ready() -> void:
	velocity = Vector2(speed, 0).rotated(global_rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.has_method("hit") and collision.collider.is_in_group("enemies"):
			collision.collider.hit()
			queue_free()
		elif collision.collider != find_node("Player"):
			queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
