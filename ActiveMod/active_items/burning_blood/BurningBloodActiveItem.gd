extends "res://ActiveMod/base_active_item/BaseActiveItem.gd"


const BUFF_NAME: String = "BurningBloodBuff"


var _duration: float = 10.0


func setup(player: Player) -> void:
	ClassRegistry.register(BUFF_NAME, "res://ActiveMod/active_items/burning_blood/BurningBloodBuff.gd")
	
	_charge_time = 1.0
	
	super.setup(player)


func activate() -> void:
	if _player.health < 2.0:
		return
	
	super.activate()
	
	var buff_resource: Resource = ClassRegistry.get_loaded_class(BUFF_NAME)
	@warning_ignore("unsafe_method_access")
	var buff_instance: Buff = buff_resource.new(_duration)
	add_buff(buff_instance)
	
	var atk: Attack = Attack.new(_player.health / 2.0)
	_player.take_damage(atk)
