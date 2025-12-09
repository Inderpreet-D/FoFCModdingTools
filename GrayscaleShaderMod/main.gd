extends BaseMod


const MOD_NAME: String = "GrayscaleShaderMod"


func _update_mod_info() -> void:
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "name",
		name = "Name",
		value = "Grayscale Shader Mod"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "version",
		name = "Version",
		value = "1.0.0"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "description",
		name = "Version",
		value = "Adds a grayscale filter to the game"
	}))


func init_mod() -> void:
	print("Init grayscale shader")
	
	_update_mod_info()
	
	# Add shader overlay to scene
	var scene: PackedScene = load("res://GrayscaleShaderMod/node/GrayscaleOverlay.tscn")
	var instance: CanvasLayer = scene.instantiate()
	ModLoader.add_child(instance)
