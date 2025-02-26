class_name Background extends Parallax2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	autoscroll.x = -Global.settings.speed * scroll_scale.x
	repeat_size.x = get_viewport_rect().size.x
