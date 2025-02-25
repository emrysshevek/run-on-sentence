class_name FlipComponent extends MovementComponent

func _activate(_delta: float, type: InputManager.InputType) -> void:
	if type == InputManager.InputType.PRESS:
		gravity_component.gravity_scale = -1.5 * sign(gravity_component.gravity_scale)
