extends Node

func _ready():
	var original_stream = preload("res://assets/audio/3711ee1ed2d86cace91cad20b9f68d66Samorost_3_Soundtrack_10_-_Dry_Wooden_and_Windy_Fl (1).ogg")  # <- Reemplaza esto con tu ruta real
	var stream = original_stream.duplicate() as AudioStream
	stream.loop = true

	var player = $AudioStreamPlayer
	player.stream = stream
	player.play()
