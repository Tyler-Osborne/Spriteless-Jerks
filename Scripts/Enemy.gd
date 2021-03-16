extends KinematicBody2D

const MOVE_SPEED : int = 150

var player = null

func _ready():
	add_to_group("enemies")
	player = get_parent().find_node("Player")

func _physics_process(delta):
	if player == null:
		return
	
	var vector_to_player : Vector2 = player.global_position - global_position
	vector_to_player = vector_to_player.normalized()
	global_rotation = atan2(vector_to_player.y, vector_to_player.x)
	var collision = move_and_collide(vector_to_player * MOVE_SPEED * delta)

	if collision != null:
		if collision.collider.name == "Player" and collision.collider.has_method("hit"):
			collision.collider.hit()

func hit():
	queue_free()
