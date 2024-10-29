extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Data.BlocksBroken = 8
	Data.level = 2
	await get_tree().create_timer(1.0).timeout
	$CanvasLayer/Levelname.hide()
	await get_tree().create_timer(15.0).timeout
	Data.levelfail()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
