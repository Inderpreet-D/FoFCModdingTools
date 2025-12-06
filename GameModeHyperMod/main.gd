extends BaseMod


func init_mod() -> void:
	print("Init hyper game mode mod")
	
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
