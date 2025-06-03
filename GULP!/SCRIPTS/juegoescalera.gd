extends Node2D

@onready var sound = $AudioStreamPlayer2D
@onready var boton_continuar = $BotonContinuar

func _ready() -> void:
	# Ocultar el botón al inicio
	boton_continuar.visible = false
	
	# Reiniciar todas las piezas a su posición original
	for child in get_children():
		if child.has_method("reset_piece"):
			child.reset_piece()

func check_all_placed():
	print("Verificando piezas...")
	var todas_colocadas = true
	for child in get_children():
		if child.has_method("is_placed_correctly"):
			if not child.is_placed_correctly():
				todas_colocadas = false
				break
	if todas_colocadas:
		boton_continuar.visible = true

func _on_boton_continuar_pressed() -> void:
	sound.play()
	await get_tree().create_timer(0.4).timeout
	global2.juego_escalera_completado = true
	get_tree().change_scene_to_file("res://escenas/pantalla1.tscn")
	
