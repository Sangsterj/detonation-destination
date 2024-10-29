extends Node3D


var objects_spawning_height = 40
var objects_spawning_radius = 10

var camera_move_speed = 0.1
var camera_height = 10
var camera_distance_from_center = 16

var camera_move = 0

var newcube = load("res://cube.tscn")
var newocta = load("res://octahedron.tscn")
var num_spawned = 0
var won = false
var time_since_start = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Data.time_trials_objects_destroyed = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camera_move += camera_move_speed*delta
	$Camera3D.position.x = cos(camera_move)*camera_distance_from_center
	$Camera3D.position.y = camera_height
	$Camera3D.position.z = sin(camera_move)*camera_distance_from_center
	$Camera3D.rotation.x = -sin(camera_move/11.3)*0.04-0.3
	$Camera3D.rotation.y = -atan2(
		$Camera3D.position.z,
		$Camera3D.position.x
	)+PI/2
	$CanvasLayer/ObjectsDestroyed.text = str(Data.time_trials_objects_destroyed, "/444 objects destroyed")
	if Data.time_trials_objects_destroyed >= 444:
		$Camera3D.set_meta("no_interaction", true)
		won = true
		$CanvasLayer/WinTime.visible = true
		$CanvasLayer/WinTime.text = str("Time: ", roundi(time_since_start*10)/10.0, "s")
	else:
		time_since_start += delta


func _on_timer_timeout() -> void:
	if won:
		return
	if num_spawned >= 444:
		return
	var cpos = Vector3(
		randf()*objects_spawning_radius*2-objects_spawning_radius,
		objects_spawning_height,
		randf()*objects_spawning_radius*2-objects_spawning_radius
	)
	var selected = newcube
	if randf() > 0.9:
		selected = newocta
	var Obj = selected.instantiate()
	$Destructables.add_child(Obj)
	Obj.get_node("RigidBody3D").position = cpos
	Obj.set_meta("time_trials_eligible", true)
	num_spawned += 1
	$Timer.wait_time = randf()*0.1+0.02+0.08*(1-Data.time_trials_objects_destroyed/444)
	$Timer.start()
