class_name GravityComponent extends PhysicsComponent

@export var max_fall_speed: float = 500

var gravity_scale: float = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var gravity = body.get_gravity().y * gravity_scale
	body.velocity.y = move_toward(body.velocity.y, max_fall_speed * sign(gravity), abs(gravity) * delta)
