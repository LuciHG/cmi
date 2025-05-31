extends Node

@onready var music_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	if music_player.stream:
		music_player.stream.loop = true  # Asegura que el stream haga loop
		music_player.play()
