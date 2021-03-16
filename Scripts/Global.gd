extends Node

var pistol : Dictionary = {"Name" : "Pistol", "FireRate" : 0, "Power" : 10, "Spread" : false, "SemiAuto" : true}
var autoRifle : Dictionary = {"Name" : "AutoRifle", "FireRate" : 0.2, "Power" : 2, "Spread" : false, "SemiAuto" : false}
var shotgun : Dictionary = {"Name" : "Shotgun", "FireRate" : 1.5, "Power" : 2, "Spread" : true, "SemiAuto" : false}
var weapons : Array = [pistol, autoRifle, shotgun]
var currentWeapon : int
var title = preload("res://Scenes/TitleScreen.tscn")

func _ready() -> void:
    randomize()
    Input.set_custom_mouse_cursor(load("res://Assets/crosshair.png"), 0, Vector2(8, 8))
    currentWeapon = 0