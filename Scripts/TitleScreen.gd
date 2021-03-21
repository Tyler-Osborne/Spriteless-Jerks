extends MarginContainer

onready var game = get_node("/root/Game")

func _ready():
	rect_size = Vector2(1366, 768)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_PlayButton_pressed():
	game.add_child(Global.levels.instance())
	queue_free()

func _on_SettingsButton_pressed():
	game.add_child(Global.settings.instance())
	queue_free()
