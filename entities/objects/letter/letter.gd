class_name Letter extends GameObject

signal collected(which_letter: Letter)

@export var value: String

@onready var shape: CircleShape2D = $CollisionShape2D.shape
@onready var label: Label = $Label
@onready var screen_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

var size: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if len(value) > 1:
		push_warning("Text object was assigned more than one letter")
		value = value[0]
		
	label.text = value
	_resize.call_deferred()


func _resize() -> void:
	size = label.size
	print(value, ": ", size)
	shape.radius = size.x / 2
	screen_notifier.rect = Rect2(size.x / 2, size.y / 2, size.x, size.y)


func _on_body_entered(body: Node2D) -> void:
	if body is Runner:
		collected.emit(self)
		queue_free()
