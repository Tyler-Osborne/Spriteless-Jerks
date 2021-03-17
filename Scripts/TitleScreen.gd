extends MarginContainer

onready var game = get_node("/root/Game")

func _ready():
	rect_size = Vector2(1366, 768)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_PlayButton_pressed():
	get_parent().add_child(Global.levels.instance())

func _on_SettingsButton_pressed():
	game.add_child(Global.settings.instance())
	game.get_node("TitleScreen").queue_free()
