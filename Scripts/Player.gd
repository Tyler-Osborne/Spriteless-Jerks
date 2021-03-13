extends KinematicBody2D

const MOVE_SPEED : int = 200

onready var raycast = $RayCast2D

func _ready():
    yield(get_tree(), "idle_frame")
    get_tree().call_group("enemies", "set_player", self)

func _physics_process(delta):
    var move_vector : Vector2 = Vector2()

    if Input.is_action_pressed("move_up"):
        move_vector.y -= 1
    if Input.is_action_pressed("move_down"):
        move_vector.y += 1
    if Input.is_action_pressed("move_left"):
        move_vector.x -= 1
    if Input.is_action_pressed("move_right"):
        move_vector.x += 1
    move_vector = move_vector.normalized()

    move_and_collide(move_vector * MOVE_SPEED * delta)

    position = Vector2(clamp(position.x, 0, get_viewport_rect().size.x), \
        clamp(position.y, 0, get_viewport_rect().size.y))

    var look_vector = get_global_mouse_position() - global_position
    global_rotation = atan2(look_vector.y, look_vector.x)

    if Input.is_action_just_pressed("shoot"):
        var colliding_object = raycast.get_collider()
        if raycast.is_colliding() and colliding_object.has_method("kill"):
            colliding_object.kill()
    
    if get_tree().get_nodes_in_group("enemies").size() == 0:
        kill()

func kill():
    get_tree().reload_current_scene()