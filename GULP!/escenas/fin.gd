extends Node  # O Control si estás usando UI

@onready var click_sound = $clicksound
@onready var galeria_button = $galeria
@onready var creditos_button = $creditos
@onready var jugar_button = $jugar

func _ready():
	galeria_button.pressed.connect(_on_galeria_pressed)
	creditos_button.pressed.connect(_on_creditos_pressed)
	jugar_button.pressed.connect(_on_jugar_pressed)

func _on_galeria_pressed():
	click_sound.play()
	await get_tree().create_timer(0.4).timeout
	get_tree().change_scene_to_file("res://escenas/galeriabuena.tscn")

func _on_creditos_pressed():
	click_sound.play()
	await get_tree().create_timer(0.7).timeout
	get_tree().change_scene_to_file("res://escenas/creditosnuevos.tscn")

func _on_jugar_pressed():
	click_sound.play()
	await get_tree().create_timer(0.7).timeout
	get_tree().change_scene_to_file("res://escenas/pantalla0.5.tscn")
