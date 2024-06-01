class_name Turret extends Node3D

@export var projectile: PackedScene = null

@export var turret_range: float = 10.0

var enemy_path: Path3D = null
var target: Enemy = null

@onready var turret_top: MeshInstance3D = $TurretBase/TurretTop

func _physics_process(delta: float) -> void:
	target = find_best_target()
	if target:
		look_at(target.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	if target:
		var shot: Projectile = projectile.instantiate()
		add_child(shot)
		shot.global_position = turret_top.global_position
		shot.direction = global_transform.basis.z

func find_best_target() -> Enemy:
	var best_target: Enemy = null
	var best_progress: float = 0.0
	for e: Node3D in enemy_path.get_children():
		if e is Enemy:
			if e.progress > best_progress:
				var distance: float = global_position.distance_to(e.global_position)
				if distance < turret_range:
					best_target = e
					best_progress = e.progress
	
	return best_target
