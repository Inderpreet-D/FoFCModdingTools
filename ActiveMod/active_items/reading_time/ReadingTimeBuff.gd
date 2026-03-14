extends Buff


var _starting_speed_modifier: float


func _init(duration: float) -> void:
	super._init()
	_duration = duration
	effect_name = "ReadingTimeBuff"


func on_attach() -> void:
	super.on_attach()
	
	if not _is_player:
		return
	
	_starting_speed_modifier = _player.speed_modifier
	_player.speed_modifier = 0.0


func get_attack_delay_modifier(_delay: float, _weapon: Weapon) -> float:
	return 10000.0


func on_detach() -> void:
	super.on_detach()
	
	if not _is_player:
		return
	
	_player.speed_modifier = _starting_speed_modifier
	Global.add_xp(Global.xp_needed / _player.stats.xp_gain)
