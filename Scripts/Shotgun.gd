extends "res://Scripts/Weapon.gd"

# green

func _ready() -> void:
	$ColorRect.color = Color("green")
	currentWeapon = Global.weapons[2]
	firerate = currentWeapon.firerate
	Global.currentWeapon = 2

func _process(delta):
	currentTime -= delta
	if Input.is_action_pressed("shoot") and currentTime <= 0:
		_shoot()
		currentTime = firerate

func _shoot():
	for angle in spreadAngles:
		var rad = deg2rad(angle)
		var b = bullet.instance()
		b.set_as_toplevel(true)
		b.global_rotation = muzzle.global_rotation + rad
		b.global_position = muzzle.global_position
		get_tree().root.add_child(b)