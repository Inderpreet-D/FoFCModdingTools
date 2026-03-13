class_name BaseActiveItem extends Node2D


@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var sprite_2d_material: ShaderMaterial = sprite_2d.material
@onready var canvas_group_material: ShaderMaterial = (%CanvasGroup as CanvasGroup).material


var _player: Player
var _elapsed: float = 0.0
var _charge_time: float = 10.0
var _start_charged: bool = true
var _auto_activate: bool = false


func _ready() -> void:
	sprite_2d.scale = Vector2(50, 50) / sprite_2d.texture.get_size()


func setup(player: Player) -> void:
	global_position = player.global_position + Vector2(0, 125)
	_player = player
	
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
	sprite_2d.modulate = _get_final_color()
	var gold_color: Color = Color(2.0, 1.68, 0.0, 1.0)
	canvas_group_material.set_shader_parameter("color", gold_color)


func update_uncharged_ui(progress: float) -> void:
	sprite_2d.modulate = lerp(Color.WHITE, _get_final_color(), progress)
	canvas_group_material.set_shader_parameter("color", Color.TRANSPARENT)


func _process(delta: float) -> void:
	_elapsed += delta
	var progress: float = get_charge_progress()
	sprite_2d_material.set_shader_parameter("progress", progress)
	
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


func add_buff(buff: Buff) -> void:
	if not is_instance_valid(_player):
		return
	
	_player.effects.add_effect(buff)
	Passives.passives_changed.emit()
	EventBus.inventory_updated.emit()
