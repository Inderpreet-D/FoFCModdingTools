extends BaseMod


func init_mod() -> void:
	print("Init background mod")
	
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
