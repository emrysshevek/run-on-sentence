extends CharacterBody2D

@export var move_component: MovementComponent

func _ready() -> void:
	move_component.is_active = true

func _physics_process(delta: float) -> void:
	if move_component.can_activate:
		var actions = InputManager.get_actions()
		if "primary_action" in actions:
			move_component.activate(delta, actions["primary_action"])

	move_and_slide()
