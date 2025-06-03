extends Node2D

@onready var timer = $Timer
@onready var sprite3 = $Sprite2D3
@onready var button = $TextureButton
@onready var button2 = $TextureButton2
@onready var click_sound = $clicksound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite3.visible = false
	button.visible = false
	button.disabled = true
	button2.visible = false
	button2.disabled = true
	timer.wait_time = 2.0  # segundos que tarda en aparecer
	timer.one_shot = true
	timer.start()


func _on_timer_timeout() -> void:
	sprite3.visible = true
	button2.visible = true
	button2.disabled = false



func _process(delta: float) -> void:
	pass

func _on_texture_button_2_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.7).timeout
	sprite3.visible = false
	button2.visible = false
	button2.disabled = true
	button.visible = true
	button.disabled = false

func _on_texture_button_pressed() -> void:
	await get_tree().create_timer(0.7).timeout
	get_tree().change_scene_to_file("res://escenas/pantalla1.tscn")
