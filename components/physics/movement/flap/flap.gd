class_name FlapComponent extends MovementComponent

@export var flap_speed: float = -200
@export var rotate_range: float = 15


func _physics_update(delta: float) -> void:
	body.rotation_degrees = rotate_range * min(body.velocity.y, abs(flap_speed)) / abs(flap_speed)


func _activate(_delta: float, type: InputManager.InputType) -> void:
	if type == InputManager.InputType.PRESS:
		body.velocity.y = flap_speed
