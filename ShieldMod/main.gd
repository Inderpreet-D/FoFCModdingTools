extends BaseMod


const MOD_NAME: String = "ShieldMod"


func _update_mod_settings() -> void:
	ModLoader.config.update_setting(MOD_NAME, ModConfigSetting.new({
		id = "tier",
		name = "Level of Shield Smith required, 0 means the shield can always drop",
		default_value = 0,
		options = [0, 1, 2]
	}))
	
	ModLoader.config.update_setting(MOD_NAME, ModConfigSetting.new({
		id = "title",
		name = "Shield name",
		default_value = "EMP Shield",
		options = [
			"EMP Shield",
			"Electro-magnetic Pulse Shield",
			"Pulse Shield",
			"Mod Shield"
		]
	}))


func init_mod() -> void:
	print("Init shield mod")
	
	_update_mod_settings()
	
	# Allow the shield class to be instantiated later
	ClassRegistry.register("EMPShield", "res://ShieldMod/EMPShield.gd")
	
	ModLoader.mod_config_loaded.connect(func() -> void:
		var selected_tier: int = ModLoader.config.get_setting_value(MOD_NAME, "tier")
		var selected_title: String = ModLoader.config.get_setting_value(MOD_NAME, "title")
		
		# Define new shield
		var def: ShieldDef = ShieldDef.new({
			"description": "Stops projectiles when <broken>",
			"icon": "res://ShieldMod/sprite.png",
			# The "key" property needs to match a class name
			"key": "EMPShield",
			# The "tier" property determines what level of the "Shield Smith" library upgrade is needed for this shield to drop
			# A value of 0 means the shield can always drop
			"tier": selected_tier,
			"title": selected_title
		})
		
		# Add the shield to the existing list, will override any existing one with the same key
		DefHandler.add_shield(def)
	)
