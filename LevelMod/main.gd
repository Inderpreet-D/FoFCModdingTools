extends BaseMod


const MOD_NAME: String = "LevelMod"


func _update_mod_info() -> void:
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "name",
		name = "Name",
		value = "Level Mod"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "version",
		name = "Version",
		value = "1.0.0"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "description",
		name = "Version",
		value = "Adds a new level (Swamp)"
	}))


func init_mod() -> void:
	print("Init level mod")
	
	_update_mod_info()
	
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
			# Which direction the map will be in relation to the randomize button
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
