extends "res://ActiveMod/base_active_item/BaseActiveItem.gd"


func setup(player: Player) -> void:
	_charge_time = 60.0
	
	super.setup(player)


func activate() -> void:
	super.activate()
	
	_player.equip_shield(StandardShield.new())
