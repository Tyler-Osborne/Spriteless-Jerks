extends ColorRect

onready var title = preload("res://Scenes/TitleScreen.tscn")

func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/TitleScreen.tscn")