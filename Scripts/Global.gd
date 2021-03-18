extends Node

var pistol : Dictionary = {"Name" : "Pistol", "FireRate" : 0.5, "Power" : 10, "Spread" : false, "SemiAuto" : true, "Color" : Color.red}
var autoRifle : Dictionary = {"Name" : "AutoRifle", "FireRate" : 0.2, "Power" : 2, "Spread" : false, "SemiAuto" : false, "Color" : Color.purple}
var shotgun : Dictionary = {"Name" : "Shotgun", "FireRate" : 1.5, "Power" : 2, "Spread" : true, "SemiAuto" : false, "Color" : Color.orange}
var oregano : Dictionary = {"Name" : "Oregano", "FireRate" : 0.2, "Power" : 2, "Spread" : true, "SemiAuto" : false, "Color" : Color.green}
var weapons : Array = [pistol, autoRifle, shotgun, oregano]
var currentWeapon : int
var title = preload("res://Scenes/TitleScreen.tscn")
var settings = preload("res://Scenes/InputMapper.tscn")
var levels = preload("res://Scenes/Level.tscn")
var randomizer = RandomNumberGenerator.new()
func _ready() -> void:
	randomizer.randomize()
	currentWeapon = 0