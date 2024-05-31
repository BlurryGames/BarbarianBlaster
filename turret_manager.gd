class_name TurretManager extends Node3D

@export var turret: PackedScene = null

func _ready() -> void:
	var new_turret: Node3D = turret.instantiate()
	add_child(new_turret)
