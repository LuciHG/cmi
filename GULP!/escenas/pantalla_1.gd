extends Node2D

@onready var sound = $click_sound
@onready var sound2 = $click_sound2
@onready var image1 = $FoundImage1
@onready var image2 = $FoundImage2
@onready var object1 = $Object1
@onready var object2 = $Object2
@onready var object3 = $Object3
@onready var object4 = $Object4
@onready var object5 = $Object5
@onready var object6 = $Object6
@onready var botonarriba = $arriba

var first_clicked = false  # para controlar el orden
var second_clicked = false

func _ready():
	object1.input_event.connect(_on_object1_clicked)
	object2.input_event.connect(_on_object2_clicked)
	object3.input_event.connect(_on_object3_clicked)

	# Cambiar visibilidad según el estado del juego
	if global2.juego_escalera_completado:
		object1.visible = true
		object2.visible = false
		object3.visible = false
		object4.visible = false
		object5.visible = true
		object6.visible = true
		botonarriba.visible = true
		botonarriba.disabled = false
	else:
		object1.visible = true
		object2.visible = true
		object3.visible = true
		object4.visible = true
		object5.visible = false
		object6.visible = false
		botonarriba.visible = false
		botonarriba.disabled = true


func _on_object1_clicked(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		sound.play()
		image1.visible = true
		image2.visible = false
		first_clicked = true

func _on_object2_clicked(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and first_clicked:
		sound.play()
		image1.visible = false
		image2.visible = true
		second_clicked = true

func _on_object3_clicked(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and first_clicked and second_clicked:
		sound2.play()
		await get_tree().create_timer(0.7).timeout
		get_tree().change_scene_to_file("res://escenas/juegoescalera.tscn")


func _on_texture_button_pressed() -> void:
	await get_tree().create_timer(0.7).timeout
	get_tree().change_scene_to_file("res://escenas/pantalla0.5.tscn")


func _on_arriba_pressed() -> void:
	await get_tree().create_timer(0.7).timeout
	get_tree().change_scene_to_file("res://escenas/pantalla2.tscn")
