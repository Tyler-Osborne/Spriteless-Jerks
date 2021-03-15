extends Node2D

onready var bullet = preload("res://Scenes/Bullet.tscn")
onready var muzzle = $Muzzle
var currentWeapon : Dictionary
var firerate : float
var currentTime : float = 0
var spreadAngles : Array = [-45, -22.5, 0, 22.5, 45]
var mouse

func init(index : int):
	currentWeapon = Global.weapons[index]
	firerate = currentWeapon.firerate
	return self

func _process(delta):
	currentTime -= delta
	if Input.is_action_pressed("shoot") and currentTime <= 0:
		shoot()
		currentTime = firerate

func shoot():
	if currentWeapon.spread == false:
		var b = bullet.instance()
		b.set_as_toplevel(true)
		b.global_rotation = muzzle.global_rotation
		b.global_position = muzzle.global_position
		get_node("/root").add_child(b)
	elif currentWeapon.spread == true:
		for angle in spreadAngles:
			var rad = deg2rad(angle)
			var b = bullet.instance()
			b.set_as_toplevel(true)
			b.global_rotation = muzzle.global_rotation + rad
			b.global_position = muzzle.global_position
			get_node("/root").add_child(b)
			