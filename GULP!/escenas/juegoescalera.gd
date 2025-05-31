extends Node2D


@onready var sound = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func check_all_placed():
	print("Verificando piezas...")
	var todas_colocadas = true
	for child in get_children():
		if child.has_method("is_placed_correctly"):
			if not child.is_placed_correctly():
				todas_colocadas = false
				break
	if todas_colocadas:
		$BotonContinuar.visible = true


func _on_boton_continuar_pressed() -> void:
	sound.play()
	await get_tree().create_timer(0.4).timeout
	global2.juego_escalera_completado = true
	get_tree().change_scene_to_file("res://escenas/pantalla1.tscn")
