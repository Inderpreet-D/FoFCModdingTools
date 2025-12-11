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
		# Name of existing node
		var node_name: String = "%sNodeHolder" % MOD_NAME
		
		# Remove exising node if it exists
		var existing_node: Node = ModLoader.get_node_or_null(node_name)
		if existing_node:
			existing_node.queue_free()
			ModLoader.remove_child(existing_node)
		
		var node_holder: CanvasLayer = CanvasLayer.new()
		node_holder.layer = 5
		node_holder.process_mode = Node.PROCESS_MODE_ALWAYS
		node_holder.name = node_name
		ModLoader.add_child(node_holder, true)
		
		var num_nodes: int = ModLoader.config.get_setting_value(MOD_NAME, "num-nodes")
		var num_rings: int = ModLoader.config.get_setting_value(MOD_NAME, "num-rings")
		print("Adding %d nodes to %d rings, total %d nodes" % [num_nodes, num_rings, num_nodes * num_rings])
		
		var scene: PackedScene = load("res://NodeMod/node/Node.tscn")
		for ring_index: int in num_rings:
			for node_index: int in num_nodes:
				var instance: TextureRect = scene.instantiate()
				
				# Do initial setup for this node
				@warning_ignore("unsafe_method_access")
				instance.setup(num_nodes, node_index, ring_index, num_rings)
				
				# Add to holder
				node_holder.add_child(instance)
		
		print("Added nodes from node mod")
	)
