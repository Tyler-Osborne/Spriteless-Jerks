extends "res://Scripts/Weapon.gd"

# purple

func _ready() -> void:
	$ColorRect.color = Color("purple")
	Global.currentWeapon = 1
	currentWeapon = Global.weapons[1]
	firerate = currentWeapon.firerate

func _process(delta):
	currentTime -= delta
	if Input.is_action_pressed("shoot") and !currentWeapon.SemiAuto and currentTime <= 0:
		_shoot()
		currentTime = firerate
	if Input.is_action_just_pressed("shoot") and currentWeapon.SemiAuto:
		_shoot()

func _shoot():
	var b = bullet.instance()
	b.set_as_toplevel(true)
	b.global_rotation = muzzle.global_rotation
	b.global_position = muzzle.global_position
	get_tree().root.add_child(b)