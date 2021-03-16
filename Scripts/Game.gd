extends Node2D

func _ready():
	add_child(Global.title.instance())
	$TitleScreen.rect_size = Vector2(1366, 768)
