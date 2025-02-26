extends Node2D


func _physics_process(delta: float) -> void:
	for object: Node2D in $Objects.get_children():
		object.position.x -= Global.settings.speed * delta
