extends ColorRect

onready var game = get_node("/root/Game")

func _on_Timer_timeout():
	game.add_child(Global.title.instance())
	queue_free()