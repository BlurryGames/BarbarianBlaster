class_name DifficultyManager extends Node

@export var spawn_time_curve: Curve = null
@export var game_lenght: float = 30.0

@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.start(game_lenght)

func _process(_delta: float) -> void:
	print(get_spawn_time())

func game_progress_ratio() -> float:
	return 1.0 - (timer.time_left / game_lenght)

func get_spawn_time() -> float:
	return spawn_time_curve.sample(game_progress_ratio())
