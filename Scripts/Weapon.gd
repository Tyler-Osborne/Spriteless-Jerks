extends Node2D

onready var bullet = preload("res://Scenes/Bullet.tscn")
onready var muzzle = $Muzzle
var currentWeapon : Dictionary
var firerate : float
var currentTime : float = 0
var spreadAngles : Array = [-45, -33.175, -22.5, -11, 0, 11, 22.5, 33.175, 45]
var index : int

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
		get_tree().root.add_child(b)
	elif currentWeapon.spread == true:
		for angle in spreadAngles:
			var rad = deg2rad(angle)
			var b = bullet.instance()
			b.set_as_toplevel(true)
			b.global_rotation = muzzle.global_rotation + rad
			b.global_position = muzzle.global_position
			get_tree().root.add_child(b)
