class_name MovementComponent extends PhysicsComponent

@export var gravity_component: GravityComponent

var is_active: bool = false
var can_activate: bool = true

func _ready() -> void:
	super._ready()
	if gravity_component == null:
		gravity_component = body.find_child("GravityComponent")

func _physics_process(delta: float) -> void:
	if is_active:
		_physics_update(delta)

func activate(delta: float, type: InputManager.InputType) -> void:
	if is_active:
		_activate(delta, type)

func _activate(_delta: float, type: InputManager.InputType) -> void:
	pass

func _physics_update(delta: float) -> void:
	pass
