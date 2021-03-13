extends KinematicBody2D

const MOVE_SPEED : int = 150

onready var raycast : RayCast2D = $RayCast2D

var player = null

func _ready():
	add_to_group("enemies")

func _physics_process(delta):
	if player == null:
		return
	
	var vector_to_player : Vector2 = player.global_position - global_position
	vector_to_player = vector_to_player.normalized()
	global_rotation = atan2(vector_to_player.y, vector_to_player.x)
	move_and_collide(vector_to_player * MOVE_SPEED * delta)

	if raycast.is_colliding():
		var colliding_object = raycast.get_collider()
		if colliding_object.name == "Player" and colliding_object.has_method("kill"):
			colliding_object.kill()

func kill():
	queue_free()

func set_player(p):
	player = p
