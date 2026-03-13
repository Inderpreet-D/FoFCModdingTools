extends BaseActiveItem


const BUFF_NAME: String = "RegenBuff"


var _duration: float = 4.0


func setup(player: Player) -> void:
	ClassRegistry.register(BUFF_NAME, "res://ActiveMod/active_items/healing/RegenBuff.gd")

	_charge_time = 15.0
	
	super.setup(player)


func activate() -> void:
	super.activate()
	
	var buff_resource: Resource = ClassRegistry.get_loaded_class(BUFF_NAME)
	@warning_ignore("unsafe_method_access")
	var buff_instance: Buff = buff_resource.new(_duration)
	add_buff(buff_instance)
