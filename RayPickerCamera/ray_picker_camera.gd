extends Camera3D

@export var gridmap: GridMap


@onready var ray_cast_3d: RayCast3D = $RayCast3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_position: Vector2 = self.get_viewport().get_mouse_position()
	ray_cast_3d.target_position = self.project_local_ray_normal(mouse_position) * 100.0 
	ray_cast_3d.force_raycast_update()
	
	if ray_cast_3d.is_colliding():
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
		var collider = ray_cast_3d.get_collider()
		if collider is GridMap:
			var collision_point = ray_cast_3d.get_collision_point()
			var cell = gridmap.local_to_map(collision_point)
			if gridmap.get_cell_item(cell) == 0 and Input.is_action_just_pressed("click"):
				gridmap.set_cell_item(cell, 1) 	
			
				
				
				
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
