extends BaseActiveItem


func setup(player: Player) -> void:
	super.setup(player)
	
	_charge_time = 60.0


func activate() -> void:
	super.activate()
	
	_player.heal(0.5)
