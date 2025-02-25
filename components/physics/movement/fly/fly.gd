class_name FlyComponent extends MovementComponent

@export var max_fly_speed: float = -300
@export var rotation: float = 15

func _physics_update(delt: float) -> void:
	body.rotation_degrees = rotation * clamp(-body.velocity.y / max_fly_speed, -1, 1)
		
func _activate(delta: float, type: InputManager.InputType) -> void:
	if type == InputManager.InputType.PRESS:
		gravity_component.gravity_scale = -1.5
	elif type == InputManager.InputType.RELEASE:
		gravity_component.gravity_scale = 1.5
	
