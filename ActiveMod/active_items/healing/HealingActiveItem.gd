extends BaseActiveItem


var _activation_time: float
var _heal_percent: float
var _active: bool = false
var _active_elapsed: float = 0.0


func setup(player: Player) -> void:
	_charge_time = 15.0
	
	_activation_time = 4.0
	_heal_percent = 0.25
	
	super.setup(player)


func activate() -> void:
	super.activate()
	
	_active = true
	_active_elapsed = 0.0


func _process(delta: float) -> void:
	super._process(delta)
	
	if not _active:
		return
	
	_active_elapsed += delta
	if _active_elapsed >= _activation_time:
		_active = false
		return
	
	if is_instance_valid(_player):
		_player.heal((_heal_percent / _activation_time) * delta)
