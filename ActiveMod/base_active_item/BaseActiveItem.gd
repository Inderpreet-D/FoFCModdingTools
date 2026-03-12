class_name BaseActiveItem extends Node2D


@onready var texture_progress_bar: TextureProgressBar = %TextureProgressBar
@onready var texture_progress_bar_material: ShaderMaterial = texture_progress_bar.material


var _player: Player
var _elapsed: float
var _charge_time: float
var _start_charged: bool = true
var _auto_activate: bool = false


func _ready() -> void:
	texture_progress_bar.position = -texture_progress_bar.size / 2.0


func setup(player: Player) -> void:
	global_position = player.global_position + Vector2(0, 125)
	_player = player
	_charge_time = 10.0
	
	if _start_charged:
		_elapsed = _charge_time
	else:
		_elapsed = 0.0


func can_activate() -> bool:
	return _elapsed >= _charge_time


func get_charge_progress() -> float:
	var progress: float = clampf(_elapsed / _charge_time, 0.0, 1.0)
	return progress


func _get_final_color() -> Color:
	var final_color: Color = Color(2.0, 2.0, 2.0, 1.0)
	return final_color


func update_charged_ui() -> void:
	texture_progress_bar.modulate = _get_final_color()
	var gold_color: Color = Color(2.0, 1.68, 0.0, 1.0)
	texture_progress_bar_material.set_shader_parameter("color", gold_color)


func update_uncharged_ui(progress: float) -> void:
	texture_progress_bar.modulate = lerp(Color.WHITE, _get_final_color(), progress)
	texture_progress_bar_material.set_shader_parameter("color", Color.TRANSPARENT)


func _process(delta: float) -> void:
	_elapsed += delta
	var progress: float = get_charge_progress()
	texture_progress_bar.value = progress
	
	if can_activate():
		update_charged_ui()
	else:
		update_uncharged_ui(progress)
	
	if _auto_activate and can_activate():
		activate()


func activate() -> void:
	_elapsed = 0.0


func clean_up() -> void:
	queue_free()
