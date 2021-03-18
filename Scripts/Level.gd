extends Node2D

var enemy = preload("res://Scenes/Enemy.tscn")

func _on_StartTimer_timeout():
	$EnemyTimer.start()

func _on_EnemyTimer_timeout():
	if get_tree().get_nodes_in_group("enemies").size() < 4:
		var currentEnemy = enemy.instance()
		var ranger = Global.randomizer.randi_range(1, 4)
		add_child(currentEnemy)
		match ranger:
			1:
				currentEnemy.global_position = Vector2(16, clamp(Global.randomizer.randi_range(16, get_viewport().get_visible_rect().size.y) - 16, 112, get_viewport().get_visible_rect().size.y - 16))
			2:
				currentEnemy.global_position = Vector2(1350, clamp(Global.randomizer.randi_range(0, get_viewport().get_visible_rect().size.y - 16), 112, get_viewport().get_visible_rect().size.y - 16))
			3:
				currentEnemy.global_position = Vector2(clamp(Global.randomizer.randi_range(0, get_viewport().get_visible_rect().size.x) - 16, 16, get_viewport().get_visible_rect().size.y - 16), 112)
			4:
				currentEnemy.global_position = Vector2(clamp(Global.randomizer.randi_range(0, get_viewport().get_visible_rect().size.x) - 16, 16, get_viewport().get_visible_rect().size.y - 16), 752)
		currentEnemy._ready()
