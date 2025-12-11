extends TextureRect


@onready var start_position: Vector2 = position


var texture_offset: Vector2 = Vector2.UP * 200.0
var starting_texture_offset: Vector2
var speed: float = 1.5
var starting_speed: float
var rotation_speed: float = -2.0
var starting_rotation_speed: float
var shift: float
var starting_shift: float
var alpha: float


# Set initial variables
func setup(num_nodes: int, node_index: int, ring_index: int, num_rings: int) -> void:
	texture_offset = texture_offset.rotated((TAU / num_nodes) * node_index)
	texture_offset = texture_offset.rotated(ring_index * (PI / 3))
	starting_texture_offset = texture_offset
	
	speed *= [1, -1][ring_index % 2]
	starting_speed = speed
	
	rotation_speed *= (1.0 + ((ring_index + 1) / 3.0)) * [1, -1][ring_index % 2]
	starting_rotation_speed = rotation_speed
	
	shift = ring_index * 50.0
	starting_shift = shift
	
	alpha = lerpf(0.5, 0.1, float(ring_index) / float(num_rings))


# Animates the node
func _process(delta: float) -> void:
	var shift_offset: Vector2 = texture_offset.normalized() * shift
	position = start_position + texture_offset + shift_offset
	texture_offset = texture_offset.rotated(delta * speed)
	rotation += delta * rotation_speed


# Called when the game is paused
func _on_pause_started() -> void:
	texture_offset *= 0.5
	speed *= 0.4
	rotation_speed *= -1.5


# Called when the game is not paused
func _on_pause_ended() -> void:
	texture_offset = starting_texture_offset
	speed = starting_speed
	rotation_speed = starting_rotation_speed
	shift = starting_shift


func _ready() -> void:
	SceneSwitcher.pause_started.connect(_on_pause_started)
	SceneSwitcher.pause_ended.connect(_on_pause_ended)
	
	self_modulate.a = alpha
