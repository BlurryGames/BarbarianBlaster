class_name Turret extends Node3D

@export var projectile: PackedScene = null

@onready var turret_top: MeshInstance3D = $TurretBase/TurretTop

func _on_timer_timeout() -> void:
	var shot: Projectile = projectile.instantiate()
	add_child(shot)
	shot.global_position = turret_top.global_position
