class_name DifficultyManager extends Node

signal stop_spawning_enemies

@export var spawn_time_curve: Curve = null
@export var enemy_health_curve: Curve = null

@export var game_lenght: float = 180.0

@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.start(game_lenght)

func game_progress_ratio() -> float:
	return 1.0 - (timer.time_left / game_lenght)

func get_spawn_time() -> float:
	return spawn_time_curve.sample(game_progress_ratio())

func get_enemy_health() -> float:
	return enemy_health_curve.sample(game_progress_ratio())

func _on_timer_timeout() -> void:
	stop_spawning_enemies.emit()
