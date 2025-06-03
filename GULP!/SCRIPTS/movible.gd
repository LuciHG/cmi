extends Node2D

var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos: Vector2
@export var textura: Texture
@onready var sprite = $Sprite2D
# En Movible.gd
@export var pieza_id: int = 0
@onready var audio = $AudioStreamPlayer2D
var placed_correctly = false


func _ready() -> void:
	# Guardamos la posición actual como posición inicial
	initialPos = position
	if textura:
		sprite.texture = textura


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		if draggable:
				if Input.is_action_pressed("click"):
						global_position = get_global_mouse_position()
						global.is_dragging=true
				elif Input.is_action_just_released("click"):
					global.is_dragging = false
					var tween = get_tree().create_tween()
					if is_inside_dropable and body_ref.hueco_id == pieza_id:
						var drop_global_pos = body_ref.global_position
						tween.tween_property(self, "global_position", drop_global_pos, 0.2).set_ease(Tween.EASE_OUT)
						audio.play()  # 🎵 Reproduce sonido
						placed_correctly = true
						get_parent().check_all_placed()  # Avisamos al juego principal
					else:
						tween.tween_property(self, "position", initialPos, 0.2).set_ease(Tween.EASE_OUT)
   
	


func _on_area_2d_mouse_entered() -> void:
	# el mouse esta sobre objeto (si no se esta moviendo, activar)
		if not global.is_dragging:
				draggable=true
				scale = Vector2(1.05, 1.05)


func _on_area_2d_mouse_exited() -> void:
	# el mouse sale del objeto (si no se esta moviendo, desactivar)
		if not global.is_dragging:
				draggable=false
				scale = Vector2(1, 1)


func _on_area_2d_body_entered(body: Node2D) -> void:
		if body.is_in_group("dropable"):
				is_inside_dropable = true
				body_ref = body



func _on_area_2d_body_exited(body: Node2D) -> void:
		if body.is_in_group("dropable"):
				is_inside_dropable = true
				body.modulate = Color(Color.MEDIUM_AQUAMARINE, 0.7)
				
func is_placed_correctly() -> bool:
	return placed_correctly
				
				
func reset_piece():
	position = initialPos
	placed_correctly = false
	draggable = false
	is_inside_dropable = false
	body_ref = null
	scale = Vector2(1, 1)
