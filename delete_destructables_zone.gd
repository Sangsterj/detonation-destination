extends Node3D


var RedLaser = load("res://red_laser.tscn")
var IsANuke = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	if IsANuke == true:
		if body.get_parent().has_meta("destructable"):
			await get_tree().create_timer(randf()*0.2).timeout
			for i in range(2):
				var laser = RedLaser.instantiate()
				body.get_parent().add_child(laser)
				laser.rotation.y = randf()*PI
				laser.rotation.x = PI
				laser.rotation.z = PI/2
				laser.position.x = body.position.x + randf()-0.5
				laser.position.z = body.position.z + randf()-0.5
			#var vertlaser = RedLaser.instantiate()
			#body.get_parent().add_child(vertlaser)
			#vertlaser.rotation.z = PI/2.0
			#vertlaser.position = body.position
			body.get_parent().explode()
		
	else:
		if body.get_parent().has_meta("destructable"):
			await get_tree().create_timer(randf()*0.2).timeout
			for i in range(3):
				var laser = RedLaser.instantiate()
				body.get_parent().add_child(laser)
				laser.rotation.y = randf()*PI
				laser.rotation.x = randf()*PI
				laser.rotation.z = randf()*PI
				laser.position = body.position
			#var vertlaser = RedLaser.instantiate()
			#body.get_parent().add_child(vertlaser)
			#vertlaser.rotation.z = PI/2.0
			#vertlaser.position = body.position
			body.get_parent().explode()
