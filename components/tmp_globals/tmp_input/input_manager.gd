extends Node

enum InputType {PRESS, HOLD, RELEASE}

@export var buffer_duration: float = .1

var buffered_actions: Dictionary
var current_actions: Dictionary

@onready var timer: Timer = $Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	_buffer_actions()
	
	
func _buffer_actions() -> void:
	current_actions = {}

	for action in InputMap.get_actions():
		if Input.is_action_just_released(action):
			current_actions[action] = InputType.RELEASE
		elif Input.is_action_just_pressed(action):
			current_actions[action] = InputType.PRESS
		elif Input.is_action_pressed(action):
			current_actions[action] = InputType.HOLD

	if current_actions.size() > 0:
		_clear_buffer()
		buffered_actions = current_actions
		timer.start()
	elif buffered_actions.size() > 0:
		current_actions = buffered_actions

func get_actions() -> Dictionary:
	if not buffered_actions.is_empty():
		_clear_buffer()
	return current_actions

func _clear_buffer() -> void:
	buffered_actions = {}
	timer.stop()

func _on_timer_timeout() -> void:
	_clear_buffer()
