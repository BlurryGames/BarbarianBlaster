class_name Turret extends Node3D

@export var projectile: PackedScene = null

func _ready() -> void:
	var shot: Projectile = projectile.instantiate()
	add_child(shot)
