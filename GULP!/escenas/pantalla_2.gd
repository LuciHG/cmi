extends Node2D

@onready var sprite = $Sprite2D2
@onready var timer = $Timer
@onready var button = $TextureButton
@onready var click_sound = $clicksound

func _ready():
	sprite.visible = false
	button.visible = false
	button.disabled = true
	timer.wait_time = 2.0  # segundos que tarda en aparecer
	timer.one_shot = true
	timer.start()

func _on_timer_timeout():
	sprite.visible = true
	button.visible = true
	button.disabled = false


func _on_texture_button_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.7).timeout
	get_tree().change_scene_to_file("res://escenas/fin.tscn")
