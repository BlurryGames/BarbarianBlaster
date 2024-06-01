class_name EnemyPath extends Path3D

@export var enemy_scene: PackedScene = null

func spawn_enemy() -> void:
	var new_enemy: Enemy = enemy_scene.instantiate()
	add_child(new_enemy)
