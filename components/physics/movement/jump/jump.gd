class_name JumpComponent extends MovementComponent

@export var jump_velocity: float = -700


func _physics_update(delta: float) -> void:
	_update_jump_gravity()
	
		
func _update_jump_gravity() -> void:
	if body.is_on_floor():
		can_activate = true
		gravity_component.gravity_scale = 1
	else:
		can_activate = false
		if body.velocity.y >= 0:
			gravity_component.gravity_scale = 1

func _activate(_delta: float, type: InputManager.InputType) -> void:
	body.velocity.y = jump_velocity
