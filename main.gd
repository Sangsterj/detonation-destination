extends Node
@export var scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().call_group("Scenes", "queue_free")
	var TitleScreen = scene.instantiate()
	add_child(TitleScreen)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("reset"):
		get_tree().call_group("Scenes", "queue_free")
		var TitleScreen = scene.instantiate()
		add_child(TitleScreen)
	pass
