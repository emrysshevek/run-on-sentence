extends Node2D

func _process(delta: float) -> void:
	$CanvasLayer/Label.text = "FPS: " + str(Engine.get_frames_per_second())
	_move_game_objects(delta)
#
func _move_game_objects(delta: float) -> void:
	for object: Node2D in $Objects.get_children():
		object.position.x -= Global.settings.speed * delta
