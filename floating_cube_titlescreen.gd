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
	$RigidBody3D.position.x = starting_pos.x
	$RigidBody3D.position.y = starting_pos.y + 0.1*sin(1.5*time)
	$RigidBody3D.position.z = starting_pos.z
	$RigidBody3D.rotation.y = time/0.3
	$RigidBody3D.rotation.x = -cos(time)*0.2
	$RigidBody3D.rotation.z = -sin(time)*0.2
	var box : BoxShape3D = $RigidBody3D/CollisionShape3D.shape
	box.size.x = 2.5
	box.size.y = 2.5
	box.size.z = 2.5

# todo: do something on destroyed


func _on_on_destroy() -> void:
	if get_meta("action") == "start":
		await get_tree().create_timer(0.6).timeout
		get_tree().change_scene_to_file("res://level_1.tscn")
	if get_meta("action") == "exit":
		get_tree().quit()
	if get_meta("action") == "zen":
		await get_tree().create_timer(0.6).timeout
		Data.Unlock()
		Data.Unlock()
		Data.Unlock()
		Data.Unlock()
		Data.Unlock()
		Data.HaveWeaponBox = true
		get_tree().change_scene_to_file("res://zen_mode.tscn")
