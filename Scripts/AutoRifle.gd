extends "res://Scripts/Weapon.gd"

# purple

func _ready() -> void:
	$ColorRect.color = Color("purple")
	currentWeapon = Global.weapons[1]
	firerate = currentWeapon.firerate
	Global.currentWeapon = 1

func _process(delta):
	currentTime -= delta
	if Input.is_action_pressed("shoot") and currentTime <= 0:
		_shoot()
		currentTime = firerate

func _shoot():
	var b = bullet.instance()
	b.set_as_toplevel(true)
	b.global_rotation = muzzle.global_rotation
	b.global_position = muzzle.global_position
	get_tree().root.add_child(b)