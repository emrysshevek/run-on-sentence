class_name PhysicsComponent extends Node

@export var body: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#if owner == null or not is_instance_valid(owner) or not owner.is_node_ready():
		#await owner.ready
	
	body = owner
