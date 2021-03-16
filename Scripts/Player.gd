extends KinematicBody2D

const MOVE_SPEED : int = 200

var currentWeapon

func _ready():
	yield(get_tree(), "idle_frame")
	get_tree().call_group("enemies", "set_player", self)
	set_weapon(Global.currentWeapon)
	

func _process(_delta):  
	if get_tree().get_nodes_in_group("enemies").size() == 0:
		#hit()
		pass
	if Input.is_action_just_pressed("next_weapon"):
		set_weapon(Global.currentWeapon + 1)
	elif Input.is_action_just_pressed("previous_weapon"):
		set_weapon(Global.currentWeapon - 1)

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

func set_weapon(index : int) -> void:
	match index:
		0:
			if $WeaponSlot.get_child_count() > 0:
				var kids = $WeaponSlot.get_children()
				for k in kids:
					k.queue_free()
			currentWeapon = preload("res://Scenes/Pistol.tscn")
			add_child(currentWeapon.instance())
		1:
			if $WeaponSlot.get_child_count() > 0:
				var kids = $WeaponSlot.get_children()
				for k in kids:
					k.queue_free()
			currentWeapon = preload("res://Scenes/AutoRifle.tscn")
			add_child(currentWeapon.instance())
		2:
			if $WeaponSlot.get_child_count() > 0:
				var kids = $WeaponSlot.get_children()
				for k in kids:
					k.queue_free()
			currentWeapon = preload("res://Scenes/Shotgun.tscn")
			add_child(currentWeapon.instance())
