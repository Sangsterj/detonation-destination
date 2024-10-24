extends "res://camera_base.gd"
# script to move the camera position with WASD, space, shift, and right click to move the camera rotation
# made for testing purposes, do not use in final product


var move_speed = 4
var init_click_pos: Vector2
var clicking_before = false
var delta_smooth: Vector2 = Vector2(0, 0)
var smoothing = 29
var InAWall = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	base_camera_process(delta)  # important !!
		
	if InAWall == false:
		var lr = (int(Input.is_action_pressed("right"))-int(Input.is_action_pressed("left")))
		var fb = (int(Input.is_action_pressed("backward"))-int(Input.is_action_pressed("forward")))
		var ud = (int(Input.is_action_pressed("up"))-int(Input.is_action_pressed("down")))
		position += (ud*Vector3.UP+fb*transform.basis.z+lr*transform.basis.x)*delta*move_speed
	var delta_mouse = Vector2(0, 0)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		if not clicking_before:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			init_click_pos = get_viewport().get_mouse_position()
		else:
			delta_mouse = get_viewport().get_mouse_position() - init_click_pos
			rotation.y -= delta_smooth.x*delta
			rotation.x -= delta_smooth.y*delta
		get_viewport().warp_mouse(init_click_pos)
	else:
		if clicking_before:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	delta_smooth = delta_smooth*(1-delta*smoothing) + delta*delta_mouse*smoothing
	clicking_before = Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT)





func _on_camera_physics_body_entered(body: Node3D) -> void:
	InAWall = true
	pass # Replace with function body.


func _on_camera_physics_body_exited(body: Node3D) -> void:
	InAWall = false
	pass # Replace with function body.
