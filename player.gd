extends Node3D
var Player_rotation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Player_rotation = $Player.rotation.y
	print(Player_rotation)
	if Input.is_action_pressed("left"):
		if Player_rotation <= PI/4 and Player_rotation >= -PI/4:
			$Player.position.x -= .1
			
		if Player_rotation <= 3*PI/4 and Player_rotation > PI/4:
			$Player.position.z += .1
			
		if Player_rotation <= PI and Player_rotation > 3*PI/4 or Player_rotation >= -PI and Player_rotation < -3*PI/4 :
			$Player.position.x += .1
			
		if Player_rotation >= -3*PI/4 and Player_rotation < -1*PI/4:
			$Player.position.z -= .1
			
	if Input.is_action_pressed("right"):
		if Player_rotation <= PI/4 and Player_rotation >= -PI/4:
			$Player.position.x += .1
			
		if Player_rotation <= 3*PI/4 and Player_rotation > PI/4:
			$Player.position.z -= .1
			
		if Player_rotation <= PI and Player_rotation > 3*PI/4 or Player_rotation >= -PI and Player_rotation < -3*PI/4 :
			$Player.position.x -= .1
			
		if Player_rotation >= -3*PI/4 and Player_rotation < -1*PI/4:
			$Player.position.z += .1
	
	if Input.is_action_pressed("forward"):
		if Player_rotation <= PI/4 and Player_rotation >= -PI/4:
			$Player.position.z -= .1
			
		if Player_rotation <= 3*PI/4 and Player_rotation > PI/4:
			$Player.position.x -= .1
			
		if Player_rotation <= PI and Player_rotation > 3*PI/4 or Player_rotation >= -PI and Player_rotation < -3*PI/4 :
			$Player.position.z += .1
			
		if Player_rotation >= -3*PI/4 and Player_rotation < -1*PI/4:
			$Player.position.x += .1
	
	if Input.is_action_pressed("back"):
		if Player_rotation <= PI/4 and Player_rotation >= -PI/4:
			$Player.position.z += .1
			
		if Player_rotation <= 3*PI/4 and Player_rotation > PI/4:
			$Player.position.x += .1
			
		if Player_rotation <= PI and Player_rotation > 3*PI/4 or Player_rotation >= -PI and Player_rotation < -3*PI/4 :
			$Player.position.z -= .1
			
		if Player_rotation >= -3*PI/4 and Player_rotation < -1*PI/4:
			$Player.position.x -= .1
			
	if Input.is_action_pressed("up"):
			$Player.position.y += .1
	
	if Input.is_action_pressed("down"):
		$Player.position.y -= .1
	
	if Input.is_action_pressed("rotate_left"):
		$Player.rotate_y(.05)
	
	if Input.is_action_pressed("rotate_right"):
		$Player.rotate_y(-.05)
	
	
