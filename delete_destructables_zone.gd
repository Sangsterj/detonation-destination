extends Node3D


var RedLaser = load("res://red_laser.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.get_parent().has_meta("destructable"):
		# todo: add bright red laser crossing through the cube
		await get_tree().create_timer(randf()*0.2).timeout
		var laser = RedLaser.instantiate()
		body.get_parent().add_child(laser)
		laser.rotation.y = randf()*PI
		laser.position = body.position
		body.get_parent().explode()
