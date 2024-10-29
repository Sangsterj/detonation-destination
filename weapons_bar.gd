extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Cursor.visible = true
	$Flamethrower.visible = Data.HaveWeaponFlamethrower
	$Push.visible = Data.HaveWeaponPush
	$OrbitalStrikeCannon.visible = Data.HaveWeaponNuke
	$BoxCannon.visible = Data.HaveWeaponBox
