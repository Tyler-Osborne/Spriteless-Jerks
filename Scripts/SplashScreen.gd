extends ColorRect

@onready var game = get_node("/root/Game")

func _ready():
	game.add_child.call_deferred(Global.title.instantiate())
	print("done")
	queue_free()
