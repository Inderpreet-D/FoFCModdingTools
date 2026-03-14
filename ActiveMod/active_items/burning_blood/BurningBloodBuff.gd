extends Buff


const DELAY_MULT: float = 0.66


func _init(duration: float = 10.0) -> void:
	super._init()
	effect_name = "BurningBloodBuff"
	_duration = duration


func get_attack_delay_modifier(delay: float, weapon: Weapon) -> float:
	var new_delay: float = super.get_attack_delay_modifier(delay, weapon)
	return new_delay * DELAY_MULT
