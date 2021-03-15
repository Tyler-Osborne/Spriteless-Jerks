extends KinematicBody2D

const MOVE_SPEED : int = 200

onready var weapon = preload("res://Scenes/Weapon.tscn").instance().init(2)

func _ready():
    yield(get_tree(), "idle_frame")
    get_tree().call_group("enemies", "set_player", self)
    add_child(weapon)

func _process(_delta):  
    if get_tree().get_nodes_in_group("enemies").size() == 0:
        hit()

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

func hit():
    get_tree().reload_current_scene()