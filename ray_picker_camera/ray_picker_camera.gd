class_name RayPickerCamera extends Camera3D

@export var grid_map: GridMap = null

@onready var ray_cast_3d: RayCast3D = $RayCast3D

func _process(_delta: float) -> void:
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	ray_cast_3d.target_position = project_local_ray_normal(mouse_position) * 100.0
	ray_cast_3d.force_raycast_update()
	
	if ray_cast_3d.is_colliding():
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
		var collider: Object = ray_cast_3d.get_collider()
		if collider is GridMap:
			if Input.is_action_pressed("click"):
				var collision_point: Vector3 = ray_cast_3d.get_collision_point()
				var cell: Vector3i = grid_map.local_to_map(collision_point)
				if grid_map.get_cell_item(cell) == 0:
					grid_map.set_cell_item(cell, 1)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
