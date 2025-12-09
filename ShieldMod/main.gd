extends BaseMod


const MOD_NAME: String = "ShieldMod"


func _update_mod_info() -> void:
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "name",
		name = "Name",
		value = "Shield Mod"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "version",
		name = "Version",
		value = "1.0.0"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "description",
		name = "Version",
		value = "Adds a new shield (EMP Shield)"
	}))


func init_mod() -> void:
	print("Init shield mod")
	
	_update_mod_info()
	
	# Define new shield
	var def: ShieldDef = ShieldDef.new({
		"description": "Stops projectiles when <broken>",
		"icon": "res://ShieldMod/sprite.png",
		# The "key" property needs to match a class name
		"key": "EMPShield",
		# The "tier" property determines what level of the "Shield Smith" library upgrade is needed for this shield to drop
		# A value of 0 means the shield can always drop
		"tier": 0,
		"title": "EMP Shield"
	})
	
	# Add the shield to the existing list
	DefHandler.add_shield(def)
	
	# Allow the shield class to be instantiated later
	ClassRegistry.register("EMPShield", "res://ShieldMod/EMPShield.gd")
