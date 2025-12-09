extends BaseMod


const MOD_NAME: String = "EdgeShader2Mod"


func _update_mod_info() -> void:
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "name",
		name = "Name",
		value = "Edge Shader Mod 2"
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
	print("Init edge shader mod, second version")
	
	_update_mod_info()
	
	# Add overlay to scene
	var scene: PackedScene = load("res://EdgeShader2Mod/node/Edge2Overlay.tscn")
	var instance: CanvasLayer = scene.instantiate()
	ModLoader.add_child(instance)
