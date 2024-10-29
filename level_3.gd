extends Node3D
var running = false
var time = 15
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Data.HaveWeaponBox = false
	Data.HaveWeaponFlamethrower = false
	Data.HaveWeaponNuke = false
	Data.HaveWeaponPush = true
	$CanvasLayer/NoClick.hide()
	$CanvasLayer/ComeOn.hide()
	Data.BlocksBroken = 17
	Data.level = 3
	await get_tree().create_timer(2.0).timeout
	$CanvasLayer/Levelname.hide()
	$CanvasLayer/NoClick.show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("push") :
		$CanvasLayer/NoClick.hide()
		pass
		
	if Data.current_weapon == Data.Weapon.CLICK :
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			$CanvasLayer/ComeOn.show()
			await get_tree().create_timer(1.0).timeout
			Data.levelfail()
			pass
