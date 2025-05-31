extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready() -> void:
	# Asegúrate de que la animación 'default' existe
	if not "default" in animated_sprite_2d.sprite_frames.get_animation_names():
		print("⚠ Error: La animación 'default' no existe.")
		return

	# Asignar la animación
	animated_sprite_2d.animation = "default"

	# Desactivar el bucle de la animación
	animated_sprite_2d.sprite_frames.set_animation_loop("default", false)

	# Reproducir la animación
	animated_sprite_2d.play()

	# Conectar la señal para cuando la animación termine
	animated_sprite_2d.animation_finished.connect(_on_animated_sprite_2d_animation_finished)

# Función que se ejecuta cuando la animación termina
func _on_animated_sprite_2d_animation_finished() -> void:
	# Obtener el número total de fotogramas de la animación
	var frame_count = animated_sprite_2d.sprite_frames.get_frame_count("default")

	# Establecer el último fotograma (recuerda que los índices empiezan desde 0)
	animated_sprite_2d.frame = frame_count - 1  # El último fotograma tiene un índice de frame_count - 1

	# Desactivar el bucle de la animación, aunque ya lo hemos hecho antes
	animated_sprite_2d.sprite_frames.set_animation_loop("default", false)

	# Detener la animación (esto ya no debería ser necesario si configuramos correctamente el fotograma final)
	# animated_sprite_2d.stop()  # Detener la animación
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://escenas/fin.tscn")
