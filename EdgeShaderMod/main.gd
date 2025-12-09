extends BaseMod


const MOD_NAME: String = "EdgeShaderMod"


func _update_mod_info() -> void:
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "name",
		name = "Name",
		value = "Edge Shader Mod"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "version",
		name = "Version",
		value = "1.0.0"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "description",
		name = "Version",
		value = "Adds an edge detection filter to the game"
	}))


func init_mod() -> void:
	print("Init edge shader mod, first version")
	
	_update_mod_info()
	
	# Add node to scene
	var scene: PackedScene = load("res://EdgeShaderMod/node/EdgeOverlay.tscn")
	var instance: CanvasLayer = scene.instantiate()
	ModLoader.add_child(instance)
