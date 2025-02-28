class_name TextSpawner extends Node2D

signal spawned_letter(which_letter: Letter)
signal finished()
signal started()
signal stopped()

@export var text: String = "default"
@export var spawn_parent: Node2D
@export var autostart: bool = true
@export var max_spawns: int = 100

var total_spawns: int = 0
var is_spawning: bool = false
var last_spawn: Letter
var text_idx: int = 0

@onready var player: Runner = get_tree().get_first_node_in_group("runner")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if spawn_parent == null:
		spawn_parent = self
		
	is_spawning = false
	text = FileLoader.new().load("res://assets/simple_sabotage.txt")
	if autostart:
		start()

func _physics_process(delta: float) -> void:
	if player != null:
		global_position.y = player.global_position.y
		
	if text_idx >= len(text) or len(spawn_parent.get_children()) >= max_spawns:
		return
	
	spawn_letter()

func spawn_letter() -> void:
	var letter: Letter = preload("res://entities/objects/letter/letter.tscn").instantiate()
	
	letter.value = text[text_idx]
	
	spawn_parent.add_child(letter)
	
	if last_spawn:
		letter.global_position.x = last_spawn.global_position.x + 50
		letter.global_position.y = global_position.y
	else:
		letter.global_position = global_position
	last_spawn = letter
	
	spawned_letter.emit(letter)
	text_idx += 1
	if text_idx >= len(text):
		finished.emit()
	


func start() -> void:
	is_spawning = true
	started.emit()
	
	
func stop() -> void:
	is_spawning = false
	stopped.emit()
