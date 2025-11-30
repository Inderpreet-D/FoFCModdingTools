extends BaseMod


func init_mod() -> void:
	print("Init background mod now")
	
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
	
	# Add new background
	DefHandler.backgrounds.set(def._key, def)
	
	# Register FlashbangerBackground class, just based on path
	ClassRegistry.register("FlashbangerBackground", "res://BackgroundMod/FlashbangerBackground.gd")
