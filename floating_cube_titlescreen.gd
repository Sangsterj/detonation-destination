extends "res://destructable.gd"


var starting_pos
var time = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	starting_pos = $RigidBody3D.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	destructable_process(delta)
	time += delta
	var rpos = $RigidBody3D.position
	$RigidBody3D.position.y = starting_pos.y + 0.4*sin(1.5*time)
	$RigidBody3D.rotation.y = time/0.3
	$RigidBody3D.rotation.x = -cos(time)*0.2
	$RigidBody3D.rotation.z = -sin(time)*0.2

# todo: do something on destroyed
