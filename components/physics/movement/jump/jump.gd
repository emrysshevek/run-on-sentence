class_name JumpComponent extends MovementComponent

@export var jump_velocity: float = -400


func _physics_update(delta: float) -> void:
	if body.is_on_floor():
		can_activate = true
	else:
		can_activate = true
		if body.velocity.y >= 0:
			gravity_component.gravity_scale = 1.5
	is_active = false

func _activate(_delta: float, type: InputManager.InputType) -> void:
	body.velocity.y = jump_velocity
	is_active = true
