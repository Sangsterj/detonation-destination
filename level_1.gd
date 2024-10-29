extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Data.HaveWeaponBox = false
	Data.HaveWeaponFlamethrower = false
	Data.HaveWeaponNuke = false
	Data.HaveWeaponPush = false
	
	Data.BlocksBroken = 17
	Data.level = 1
	await get_tree().create_timer(1.0).timeout
	$CanvasLayer/Levelname.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
