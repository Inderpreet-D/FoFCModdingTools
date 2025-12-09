extends BaseMod


const MOD_NAME: String = "GameModeHyperMod"


func _update_mod_info() -> void:
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "name",
		name = "Name",
		value = "Hyper Game Mode Mod"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "version",
		name = "Version",
		value = "1.0.0"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "description",
		name = "Version",
		value = "Adds a super-short 1 minute game mode"
	}))


func init_mod() -> void:
	print("Init hyper game mode mod")
	
	_update_mod_info()
	
	# Define a new game mode
	var def: GameModeDef = GameModeDef.new({
		"description": "1 minute run with the same amount of bosses and enemies as the standard mode",
		"icon": "res://assets/sprites/ui/game_mode/game_mode_normal.png",
		# The "key" does not need to refer to anything
		"key": "hyper_mod",
		# The "scene" has to point to the path of the scene that will control this game mode
		"scene": "res://GameModeHyperMod/mode/PlayHyper.tscn",
		"title": "Hyper Mode"
	})
	
	# Add new game mode to existing list
	DefHandler.add_game_mode(def)
