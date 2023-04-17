extends Node2D

var enemy = preload("res://Scenes/Enemy.tscn")
@onready var screenRect = get_viewport().get_visible_rect().size
@onready var weapon = $Player/Weapon
@onready var killsUntilNext : Node = $HBoxContainer/ColorRect/PointsTillNext
@onready var weaponText : Node = $HBoxContainer/ColorRect2/CurrentWeapon
@onready var totalScore : Node = $HBoxContainer/ColorRect3/TotalScore
var score : int = 0

func _on_StartTimer_timeout():
	$EnemyTimer.start()

func _ready():
	Global.reset_vars()

func _process(_delta):
	killsUntilNext.text = "Next Weapon at: " + str(Global.killsLeft) + " Enemies"
	weaponText.text = Global.weapons[Global.currentWeapon].Description
	totalScore.text = "Total Score: " + str(score)
	checkForUpgrade()

func _on_EnemyTimer_timeout():
	var currentEnemy : Node
	if get_tree().get_nodes_in_group("enemies").size() < Global.maxEnemies or Global.maxEnemies == 0:
		currentEnemy = enemy.instantiate()
		add_child(currentEnemy)
		currentEnemy.set_target_to_player()
		var ranger = Global.randomizer.randi_range(1, 4)
		match ranger:
			1:
				currentEnemy.global_position = Vector2(16, clamp(Global.randomizer.randi_range(16, screenRect.y) - 16, 112, screenRect.y - 16))
			2:
				currentEnemy.global_position = Vector2(1350, clamp(Global.randomizer.randi_range(0, screenRect.y - 16), 112, screenRect.y - 16))
			3:
				currentEnemy.global_position = Vector2(clamp(Global.randomizer.randi_range(0, screenRect.x) - 16, 16, screenRect.y - 16), 112)
			4:
				currentEnemy.global_position = Vector2(clamp(Global.randomizer.randi_range(0, screenRect.x) - 16, 16, screenRect.y - 16), 752)
	if Global.maxEnemies == 0:
		$EnemyTimer.wait_time = 0.25

func checkForUpgrade():
	if Global.killsLeft <= 0 and Global.lastUnlocked < Global.weapons.size() - 1:
		Global.next_earned()
		weapon.change_weapon(Global.currentWeapon)
		Global.maxEnemies = Global.maxEnemiesArray[Global.currentWeapon]
	elif Global.lastUnlocked >= Global.weapons.size() - 1:
		Global.killsLeft = 0
