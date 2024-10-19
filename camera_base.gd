extends Node3D
# other camera scripts can inherit from this
# they must call the base_camera_process at the top of their _process method

var mouse_pressed_prev = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func base_camera_process():
	# destroy destructables
	var cam = get_viewport().get_camera_3d()
	var space_state = get_world_3d().direct_space_state
	var mpos_2d = get_viewport().get_mouse_position()
	var raycast_origin = cam.project_ray_origin(mpos_2d)
	var raycast_end = cam.project_position(mpos_2d, 1000)
	var query = PhysicsRayQueryParameters3D.create(raycast_origin, raycast_end)
	var intersect = space_state.intersect_ray(query)
	if intersect.size() > 0:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			if not mouse_pressed_prev:
				if intersect.collider.get_parent().has_meta("destructable"):
					intersect.collider.get_parent().explode()
	mouse_pressed_prev = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
