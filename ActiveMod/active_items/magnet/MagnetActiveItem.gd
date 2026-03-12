extends BaseActiveItem


func setup(player: Player) -> void:
	_charge_time = 45.0
	
	super.setup(player)


func activate() -> void:
	super.activate()
	
	var tree: SceneTree = get_tree()
	var groups: Array[StringName] = ["xp", "hp", "coin"]
	for group: StringName in groups:
		tree.call_group(group, "pickup", _player)
