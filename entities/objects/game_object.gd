class_name GameObject extends Area2D

signal destroyed(which_object: GameObject)


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	pass


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	destroyed.emit()
	queue_free()
