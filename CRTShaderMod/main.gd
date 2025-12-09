extends BaseMod


const MOD_NAME: String = "CRTShaderMod"


func _update_mod_info() -> void:
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "name",
		name = "Name",
		value = "CRT Shader Mod"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "version",
		name = "Version",
		value = "1.0.0"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "description",
		name = "Version",
		value = "Adds a CRT style filter to the game"
	}))


func init_mod() -> void:
	print("Init CRT shader mod")
	
	_update_mod_info()
	
	# Load and instantiate the shader
	var scene: PackedScene = load("res://CRTShaderMod/node/CRTOverlay.tscn")
	var instance: CanvasLayer = scene.instantiate()
	
	# Add the shader to the tree
	ModLoader.add_child(instance)
