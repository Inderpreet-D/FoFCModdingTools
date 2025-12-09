extends BaseMod


const MOD_NAME: String = "InvertShaderMod"


func _update_mod_info() -> void:
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "name",
		name = "Name",
		value = "Inverted Shader Mod"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "version",
		name = "Version",
		value = "1.0.0"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "description",
		name = "Version",
		value = "Adds an inverted filter to the game"
	}))


func init_mod() -> void:
	print("Init invert shader mod")
	
	_update_mod_info()
	
	# Add overlay node
	var scene: PackedScene = load("res://InvertShaderMod/node/InvertOverlay.tscn")
	var instance: CanvasLayer = scene.instantiate()
	ModLoader.add_child(instance)
