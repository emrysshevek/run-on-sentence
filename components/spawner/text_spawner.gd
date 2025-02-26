class_name TextSpawner extends Node2D

@export var text: String = "default"
@export var spawn_parent: Node2D
@export var autostart: bool = true
@export var max_spawns: int = 256

var total_spawns: int = 0
var is_spawning: bool = false
var last_spawn: GameObject
var text_idx: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_spawning = false
	if autostart:
		start()

func _physics_process(delta: float) -> void:
	if text_idx == len(text) or total_spawns >= max_spawns:
		return
	
	var letter = preload("res://entities/objects/letter/letter.tscn").instantiate()
	
	letter.value = text[text_idx]
	text_idx += 1
	
	if spawn_parent == null:
		get_parent().add_child(letter)
	else:
		spawn_parent.add_child(letter)
	
	if last_spawn:
		letter.global_position = last_spawn.global_position + Vector2(20, 0)
	else:
		letter.global_position = global_position
	last_spawn = letter
		
	

func start() -> void:
	is_spawning = true
	
	
func stop() -> void:
	is_spawning = false
