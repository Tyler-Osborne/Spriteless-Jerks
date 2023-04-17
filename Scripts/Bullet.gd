extends CharacterBody2D

@onready var level = get_node("/root/Game/Level")
var speed = 600
var local_velocity : Vector2

func _ready() -> void:
	local_velocity = Vector2(speed, 0).rotated(global_rotation)

func _physics_process(delta):
	var collision = move_and_collide(local_velocity * delta)
	if collision:
		if collision.get_collider().has_method("hit") and collision.get_collider().is_in_group("enemies"):
			collision.get_collider().hit()
			Global.killsLeft -= 1
			level.score += 1
			queue_free()
	if global_position.y <= 96 or global_position.y >= 768:
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
