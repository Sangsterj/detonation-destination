extends Node3D

const cube_scene = preload("res://cube.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Chill Music".play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
