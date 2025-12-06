extends BaseMod


func init_mod() -> void:
	print("Init level mod")
	
	# Define a new level
	var def: LevelDef = LevelDef.new({
		"description": "The poison swamp level.",
		"icon": "res://LevelMod/level-swamp.png",
		# The "key" should be unique
		"key": "swamp",
		# The "level_path"
		"level_path": "res://LevelMod/level/Level.tscn",
		# Used to position this level on the map select screen
		"map": {
			# Which direction the map will be in relation to the ranomdize button
			# Possible values are: top, bottom, left, right
			"focus": ["left"],
			# Actual icon to show on the map
			"icon": "res://LevelMod/map-swamp.png",
			# Position of the icon on the map
			"position": {
				"x": 25,
				"y": 470
			}
		},
		"title": "Swamp"
	})
	
	# Add level to the existing list
	DefHandler.add_level(def)
	
	# Add an entry for "Slime" to the node pool
	# This allows the SlimeEnemy to be spawned and tracked within the NodePool
	NodePool.scenes.set("Slime", load("res://LevelMod/slime/SlimeEnemy.tscn"))
