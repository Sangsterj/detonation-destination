extends Node
@export var scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var lav_testing = scene.instantiate()
	add_child(lav_testing)
	$"BG Music".play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		get_tree().call_group("Scenes", "queue_free")
		var lav_testing = scene.instantiate()
		add_child(lav_testing)
	pass
