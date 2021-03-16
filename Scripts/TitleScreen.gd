extends MarginContainer

var levels = preload("res://Scenes/Level.tscn")

func _on_PlayButton_pressed():
    get_parent().add_child(levels.instance())
    queue_free()

func _on_SettingsButton_pressed():
    pass