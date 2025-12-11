extends BaseMod


func init_mod() -> void:
	print("Init shield mod")
	
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
