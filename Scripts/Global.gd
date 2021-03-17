extends Node

var pistol : Dictionary = {"Name" : "Pistol", "FireRate" : 0, "Power" : 10, "Spread" : false, "SemiAuto" : true, "Color" : Color.red}
var autoRifle : Dictionary = {"Name" : "AutoRifle", "FireRate" : 0.2, "Power" : 2, "Spread" : false, "SemiAuto" : false, "Color" : Color.purple}
var shotgun : Dictionary = {"Name" : "Shotgun", "FireRate" : 1.5, "Power" : 2, "Spread" : true, "SemiAuto" : false, "Color" : Color.green}
var weapons : Array = [pistol, autoRifle, shotgun]
var currentWeapon : int
var title = preload("res://Scenes/TitleScreen.tscn")
var settings = preload("res://Scenes/InputMapper.tscn")
var levels = preload("res://Scenes/Level.tscn")
var randomizer = RandomNumberGenerator.new()
func _ready() -> void:
	randomizer.randomize()
	Input.set_custom_mouse_cursor(load("res://Assets/crosshair.png"), 0, Vector2(8, 8))
	currentWeapon = 0