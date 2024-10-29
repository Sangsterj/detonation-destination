extends Node3D

var NukeCooldown = 1.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Data.TimeTrialMode == true :
		$"CanvasLayer/Blocks Broken".hide()
	$"CanvasLayer/Blocks Broken".text = str("Blocks Remaining: ", Data.BlocksBroken)
	$CanvasLayer/CurrrentWeapon.text = str("Current Weapon: ", Data.weapon_name(Data.current_weapon))
	NukeCooldown -= delta
	$CanvasLayer/OrbitalStrikeCooldown.value = NukeCooldown * 100
