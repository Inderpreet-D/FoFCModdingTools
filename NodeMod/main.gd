extends BaseMod


const MOD_NAME: String = "NodeMod"


func _update_mod_settings() -> void:
	ModLoader.config.update_setting(MOD_NAME, ModConfigSetting.new({
		id = "num-nodes",
		name = "Number of nodes per ring",
		default_value = 15
	}))
	
	ModLoader.config.update_setting(MOD_NAME, ModConfigSetting.new({
		id = "num-rings",
		name = "Number of rings",
		default_value = 3
	}))


func init_mod() -> void:
	print("Init node mod")
	
	_update_mod_settings()
	
	# Called after mods and settings have been loaded
	ModLoader.mod_config_changed.connect(func() -> void:
		var num_nodes: int = ModLoader.config.get_setting_value(MOD_NAME, "num-nodes")
		var num_rings: int = ModLoader.config.get_setting_value(MOD_NAME, "num-rings")
		print("Adding %d nodes to %d rings, total %d nodes" % [num_nodes, num_rings, num_nodes * num_rings])
		
		var scene: PackedScene = load("res://NodeMod/node/Node.tscn")
		for j: int in num_rings:
			for i: int in num_nodes:
				var instance: CanvasLayer = scene.instantiate()
				
				# Do initial setup for this node
				@warning_ignore("unsafe_method_access")
				instance.setup(num_nodes, i, j)
				
				# Add to tree
				ModLoader.add_child(instance)
		
		print("Added nodes from node mod")
	)
