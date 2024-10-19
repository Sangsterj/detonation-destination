@tool
extends StaticBody3D

@export_range(1, 20) var size_x: int = 1
@export_range(1, 5) var size_y: int = 1
@export_range(1, 20) var size_z: int = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var size_vec = Vector3(size_x, size_y, size_z)
	$floor.mesh.size.x = size_x
	$floor.mesh.size.y = size_z
	$floor.position.y = 0.5*size_y+0.01
	$floor.mesh.material.uv1_scale.x = size_x
	$floor.mesh.material.uv1_scale.y = size_z
	$body.mesh.size = size_vec
	$CollisionShape3D.shape.size = size_vec
	$GPUParticlesCollisionBox3D.size = size_vec
