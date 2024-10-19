extends Node3D

var exploded = false
var explode_anim = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame (by subclass)
func destructable_process(delta: float) -> void:
	if exploded:
		explode_anim += delta
		var rb: RigidBody3D = $RigidBody3D
		if explode_anim > 2.5:
			queue_free()
		return


func explode():
	exploded = true
	var rb: RigidBody3D = $RigidBody3D
	rb.freeze = true
	rb.visible = false
	rb.collision_layer = 0
	var exp: GPUParticles3D = $ExplosionParticles
	exp.emitting = true
	exp.position = rb.position
	
func burn():
	exploded = true
	var rb: RigidBody3D = $RigidBody3D
	rb.freeze = true
	rb.visible = false
	rb.collision_layer = 0
	var exp: GPUParticles3D = $BurnParticles
	exp.emitting = true
	exp.position = rb.position
