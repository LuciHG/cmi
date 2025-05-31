extends Node2D

@export var imagenes: Array[Texture2D] = []
var index = 0
@onready var click_sound = $clicksound

func actualizar_botones() -> void:
	$siguiente.disabled = index >= imagenes.size() - 1
	$atras.disabled = index <= 0

func cambiar() -> void:
	if index >= 0 and index < imagenes.size():
		print("CAMBIAR: índice = ", index)
		$Sprite2D.texture = imagenes[index]
		actualizar_botones()
	else:
		print("⚠️ Índice fuera de rango: ", index)
	
#Called when the node enters the scene tree for the first time
func _ready() -> void:
	index = 0
	print("Índice en _ready():", index)
	cambiar()


func _on_atras_pressed() -> void:
	index = (index - 1 + imagenes.size()) % imagenes.size()
	print("Botón ATRÁS presionado. Nuevo índice: ", index)
	cambiar()


func _on_siguiente_pressed() -> void:
	if index < imagenes.size() - 1:
		index += 1
		print("SIGUIENTE: índice ahora vale ", index)
		cambiar()
	else:
		print("Ya estás en la última imagen. No se puede avanzar más.")


func _on_texture_button_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.7).timeout
	get_tree().change_scene_to_file("res://escenas/fin.tscn")
