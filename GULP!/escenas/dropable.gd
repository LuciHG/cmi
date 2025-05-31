extends StaticBody2D

# En Dropable.gd
@export var hueco_id: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	## color de inicio
		modulate = Color(Color.MEDIUM_AQUAMARINE, 0.4)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# al iniciar juego, se pone no visible si no hay objetos seleccionados
		if global.is_dragging:
				visible=true
		else:
				visible=false
	
