extends BaseMod


const MOD_NAME: String = "FastModLoaderMod"


func _update_mod_info() -> void:
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "name",
		name = "Name",
		value = "Fast Mod Loader Mod"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "version",
		name = "Version",
		value = "1.0.0"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "description",
		name = "Version",
		value = "Removes the delay that is added for debugging the mod loader"
	}))


func init_mod() -> void:
	print("Init fast mod loader mod")
	
	_update_mod_info()
	
	# Finds the node that does the mod loading
	var node: ModLoaderUI = ModLoader.get_tree().root.get_node("/root/ModLoaderUI")
	
	# Removes the artificial delay that is used for debugging issues while loading mods
	node.wait_delay = 0.0
	node.end_delay = 0.0
	
	print("Fast mod loader done")
