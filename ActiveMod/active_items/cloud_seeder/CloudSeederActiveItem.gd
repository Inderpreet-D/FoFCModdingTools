extends "res://ActiveMod/base_active_item/BaseActiveItem.gd"


var _lightning_level: int = 10


func setup(player: Player) -> void:
	_charge_time = 60.0
	
	super.setup(player)


func activate() -> void:
	super.activate()
	
	for child: Node in get_tree().get_first_node_in_group("pets").get_children():
		if child is not CloudPet:
			continue
		
		var cloud: CloudPet = child
		if cloud.player != _player:
			continue
		
		cloud.fire_queue.append(_lightning_level)
