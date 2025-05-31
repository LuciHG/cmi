extends Node2D

@onready var click_sound = $clicksound

func _ready() -> void:
	print("Iniciando escena")
	$AnimationPlayer.play("teaser_gulp")
	var ok = $AnimationPlayer.animation_finished.connect(_on_animation_player_animation_finished)
	print("Conectado:", ok)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print("Animación terminada:", anim_name)
	get_tree().change_scene_to_file("res://escenas/escena1.5.tscn")


func _on_texture_button_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.7).timeout
	get_tree().change_scene_to_file("res://escenas/fin.tscn")
