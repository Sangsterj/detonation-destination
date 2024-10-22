extends "res://destructable.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	destructable_process(delta)
	# todo: add thump-1 through thump-6 sounds based on velocity changes or collisions
