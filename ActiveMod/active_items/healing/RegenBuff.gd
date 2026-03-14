extends Buff


const HEAL_PERCENT: float = 0.25


func _init(duration: float = 4.0) -> void:
	super._init()
	effect_name = "RegenBuff"
	_duration = duration


func process(delta: float) -> bool:
	var result: bool = super.process(delta)
	
	if _is_player:
		_player.heal((HEAL_PERCENT / _duration) * delta)
	
	return result
