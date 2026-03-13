extends BaseActiveItem


var _duration: float = 4.0


func setup(player: Player) -> void:
	_charge_time = 15.0
	
	super.setup(player)


func activate() -> void:
	super.activate()
	
	add_buff(RegenBuff.new(_duration))
