extends "res://Scripts/Weapon.gd"

# red

func _ready() -> void:
	$ColorRect.color = Color("red")
	currentWeapon = Global.weapons[0]
	Global.currentWeapon = 0

func _process(_delta):
	if Input.is_action_just_released("shoot"):
		_shoot()

func _shoot():
	var b = bullet.instance()
	b.set_as_toplevel(true)
	b.global_rotation = muzzle.global_rotation
	b.global_position = muzzle.global_position
	get_tree().root.add_child(b)
