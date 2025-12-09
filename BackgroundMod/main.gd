extends BaseMod


const MOD_NAME: String = "BackgroundMod"


func _update_mod_info() -> void:
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "name",
		name = "Name",
		value = "Background Mod"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "version",
		name = "Version",
		value = "1.0.0"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "description",
		name = "Version",
		value = "Adds a new background (Flashbanger)"
	}))


func _update_mod_settings() -> void:
	ModLoader.config.update_setting(MOD_NAME, ModConfigSetting.new({
		id = "explosion-damage",
		name = "Flashbanger explosion damage",
		default_value = 2.0
	}))
	
	ModLoader.config.update_setting(MOD_NAME, ModConfigSetting.new({
		id = "explosion-radius",
		name = "Flashbanger explosion radius",
		default_value = 1030.0
	}))
	
	ModLoader.config.update_setting(MOD_NAME, ModConfigSetting.new({
		id = "explosion-expansion-rate",
		name = "Flashbanger explosion expansion rate",
		default_value = 20.0 / 1.5
	}))


func init_mod() -> void:
	print("Init background mod")
	
	_update_mod_info()
	_update_mod_settings()
	
	# Define a new background
	var def: BackgroundDef = BackgroundDef.new({
		"all_weapons": false,
		"description": ["Watch your eyes!"],
		"icon": "res://assets/sprites/player/character-default.png",
		"key": "FlashbangerBackground",
		"title": "Flashbanger",
		"weapons": [
			"pistol",
			"fire_magic",
			"rpg",
		]
	})
	
	# Add background to list of existing backgrounds
	DefHandler.add_background(def)
	
	# Register FlashbangerBackground class, based on path
	# This is required so that the background can be correctly instantiated when chosen
	ClassRegistry.register("FlashbangerBackground", "res://BackgroundMod/FlashbangerBackground.gd")
