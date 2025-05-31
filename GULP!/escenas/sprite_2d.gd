extends Sprite2D

func _process(delta: float) -> void:
	position.y = position.y + 2 
	if (position.y>1150):
		position.y = 0
