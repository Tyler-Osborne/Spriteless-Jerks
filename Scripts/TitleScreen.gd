extends MarginContainer

onready var levels = preload("res://Scenes/Level.tscn")
onready var settings = preload("res://Scenes/InputMapper.tscn")

func _ready():
	rect_size = Vector2(1366, 768)

func _on_PlayButton_pressed():
	get_parent().add_child(levels.instance())
	queue_free()

func _on_SettingsButton_pressed():
	get_parent().add_child(settings.instance())
	queue_free()
