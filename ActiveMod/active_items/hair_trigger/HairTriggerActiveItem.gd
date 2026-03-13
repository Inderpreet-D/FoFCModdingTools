extends BaseActiveItem


var _duration: float = 10.0


func setup(player: Player) -> void:
	_charge_time = 45.0
	
	super.setup(player)


func activate() -> void:
	super.activate()
	
	add_buff(HairTriggerBuff.new(_duration))
