extends BaseMod


func init_mod() -> void:
	print("Init fast mod loader mod")
	
	# Finds the node that does the mod loading
	var node: ModLoaderUI = ModLoader.get_tree().root.get_node("/root/ModLoaderUI")
	
	# Removes the artificial delay that is used for debugging issues while loading mods
	node.wait_delay = 0.0
	node.end_delay = 0.0
	
	print("Fast mod loader done")
