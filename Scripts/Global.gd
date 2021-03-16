extends Node

var pistol : Dictionary = {"name" : "Pistol", "firerate" : null, "power" : 10}
var autoRifle : Dictionary = {"name" : "AutoRifle", "firerate" : 0.2, "power" : 2}
var shotgun : Dictionary = {"name" : "Shotgun", "firerate" : 1.5, "power" : 2}
var weapons : Array = [pistol, autoRifle, shotgun]
var currentWeapon : int

func _ready() -> void:
    randomize()
    Input.set_custom_mouse_cursor(load("res://Assets/crosshair.png"), 0, Vector2(8, 8))
    currentWeapon = 0