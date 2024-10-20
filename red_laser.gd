extends Node3D


var time = 0
const LASER_TIME = 0.2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	if time > LASER_TIME:
		queue_free()
