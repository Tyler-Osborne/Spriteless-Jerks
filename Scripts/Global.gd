extends Node

var pistol : Dictionary = {"Name" : "Pistol", "FireRate" : 0.5, "Power" : 10, "Spread" : false, "Color" : Color.red, "Unlock" : 0, "Description" : "You have a Pistol"}
var autoRifle : Dictionary = {"Name" : "AutoRifle", "FireRate" : 0.2, "Power" : 2, "Spread" : false, "Color" : Color.purple, "Unlock" : 20, "Description" : "It's an AutoRifle"}
var shotgun : Dictionary = {"Name" : "Shotgun", "FireRate" : 1.5, "Power" : 2, "Spread" : true, "Color" : Color.orange, "Unlock" : 20, "Description" : "It's a Shotgun"}
var oregano : Dictionary = {"Name" : "Oregano", "FireRate" : 0.2, "Power" : 2, "Spread" : true, "Color" : Color.green, "Unlock" : 40, "Description" : "They've gone OREGANO!!!"}
var weapons : Array = [pistol, autoRifle, shotgun, oregano]
var maxEnemiesArray : Array = [4, 5, 6, 20]
var maxEnemies : int = maxEnemiesArray[0]
var killsLeft : int = weapons[1].Unlock
var currentWeapon : int = 0
var lastUnlocked : int = 0
var title = preload("res://Scenes/TitleScreen.tscn")
var settings = preload("res://Scenes/InputMapper.tscn")
var levels = preload("res://Scenes/Level.tscn")
var randomizer = RandomNumberGenerator.new()
func _ready() -> void:
	randomizer.randomize()

func next_earned():
	lastUnlocked += 1
	currentWeapon = lastUnlocked
	killsLeft = weapons[currentWeapon].Unlock

func reset_vars():
	lastUnlocked = 0
	currentWeapon = 0
	killsLeft = weapons[1].Unlock
