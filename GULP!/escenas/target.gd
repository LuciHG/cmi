extends StaticBody2D

func _ready() -> void:
	modulate = Color(Color.MEDIUM_PURPLE, 0.4)

func _process(delta: float) -> void:
	visible = global.is_dragging
	
