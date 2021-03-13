extends Node

func _ready():
    randomize()
    Input.set_custom_mouse_cursor(load("res://Assets/crosshair.png"), 0, Vector2(8, 8))