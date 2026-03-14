extends "res://ActiveMod/base_active_item/BaseActiveItem.gd"


func setup(player: Player) -> void:
	_charge_time = 20.0
	
	super.setup(player)


func activate() -> void:
	super.activate()
	
	add_buff(SpeedBoostBuff.new())
