extends Node2D

onready var bullet = preload("res://Scenes/Bullet.tscn")
onready var muzzle = $Muzzle
var currentWeapon : Dictionary
var firerate : float
var currentTime : float = 0
var spreadAngles : Array = [-45, -33.175, -22.5, -11, 0, 11, 22.5, 33.175, 45]
var index : int

func _process(_delta):
	pass

func _shoot():
	pass