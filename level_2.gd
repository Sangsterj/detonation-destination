extends Node3D
var running = false
var time = 15
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Data.HaveWeaponFlamethrower = true
	$CanvasLayer/NoClick.hide()
	$CanvasLayer/ToldYouSo.hide()
	Data.BlocksBroken = 8
	Data.level = 2
	await get_tree().create_timer(2.0).timeout
	$CanvasLayer/Levelname.hide()
	$CanvasLayer/NoClick.show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CanvasLayer/Timeleft.text = str("Time Left :", time)
	if Input.is_action_just_pressed("flamethrower") :
		$CanvasLayer/NoClick.hide()
		$CanvasLayer/Timeleft.show()
		$LevelTimer.start()
		pass
	if Data.current_weapon == Data.Weapon.CLICK :
		
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			$CanvasLayer/NoClick.hide()
			$CanvasLayer/ToldYouSo.show()
			await get_tree().create_timer(1.0).timeout
			Data.levelfail()
			pass


func _on_level_timer_timeout() -> void:
	time -= 1
	if time <= 0 :
		Data.levelfail()
	pass # Replace with function body.
