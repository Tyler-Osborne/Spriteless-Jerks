extends Node

var pistol = {"name" : "Pistol", "firerate" : 1.0, "power" : 10, "spread" : false}
var autoRifle = {"name" : "AutoRifle", "firerate" : 0.2, "power" : 2, "spread" : false}
var shotgun = {"name" : "Shotgun", "firerate" : 1.5, "power" : 2, "spread" : true}
var weapons : Array = [pistol, autoRifle, shotgun]

func _ready():
    randomize()
    Input.set_custom_mouse_cursor(load("res://Assets/crosshair.png"), 0, Vector2(8, 8))

