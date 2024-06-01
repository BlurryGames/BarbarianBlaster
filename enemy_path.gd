class_name EnemyPath extends Path3D

@export var enemy_scene: PackedScene = null

@export var victory_layer: CanvasLayer = null
@export var difficulty_manager: DifficultyManager = null

@onready var timer: Timer = $Timer

func enemy_defeated() -> void:
	if timer.is_stopped():
		for c: Node in get_children():
			if c is Enemy:
				return
		print("You won!")
		victory_layer.visible = true

func spawn_enemy() -> void:
	var new_enemy: Enemy = enemy_scene.instantiate()
	new_enemy.max_health = int(difficulty_manager.get_enemy_health())
	add_child(new_enemy)
	timer.wait_time = difficulty_manager.get_spawn_time()
	new_enemy.tree_exited.connect(enemy_defeated)

func _on_difficulty_manager_stop_spawning_enemies() -> void:
	timer.stop()
