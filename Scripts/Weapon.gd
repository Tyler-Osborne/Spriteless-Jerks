extends Node2D

onready var bullet = preload("res://Scenes/Bullet.tscn")
onready var muzzle = $Muzzle
var currentWeapon : Dictionary
var weaponName : String
var fireRate : float
var power : int
var spread : bool
var semiAuto : bool
var currentTime : float = 0
var spreadAngles : Array = [-45, -33.175, -22.5, -11, 0, 11, 22.5, 33.175, 45]

func _ready():
	currentWeapon = Global.weapons[Global.currentWeapon]
	$ColorRect.color = currentWeapon.Color
	weaponName = currentWeapon.Name
	fireRate = currentWeapon.FireRate
	power = currentWeapon.Power
	spread = currentWeapon.Spread
	semiAuto = currentWeapon.SemiAuto

func _process(delta):
	currentTime -= delta
	if Input.is_action_pressed("shoot") and !currentWeapon.SemiAuto and currentTime <= 0:
		_shoot()
		currentTime = fireRate
	if Input.is_action_just_pressed("shoot") and currentWeapon.SemiAuto:
		_shoot()

func _shoot():
	if currentWeapon.Spread:
		for angle in spreadAngles:
			var rad = deg2rad(angle)
			var b = bullet.instance()
			b.set_as_toplevel(true)
			b.global_rotation = muzzle.global_rotation + rad
			b.global_position = muzzle.global_position
			get_tree().root.add_child(b)
	elif !currentWeapon.Spread:
		var b = bullet.instance()
		b.set_as_toplevel(true)
		b.global_rotation = muzzle.global_rotation
		b.global_position = muzzle.global_position
		get_tree().root.add_child(b)

func change_weapon(index : int):
	Global.currentWeapon = index
	currentTime = 0
	_ready()