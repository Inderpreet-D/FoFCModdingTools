extends Buff


func _init(duration: float) -> void:
	super._init()
	_duration = duration
	effect_name = "HandfulBuff"


func get_shot_count_modifier(weapon: Weapon) -> int:
	var result: int = super.get_shot_count_modifier(weapon)
	return result + weapon.shot_count
