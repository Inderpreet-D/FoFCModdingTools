extends BaseMod


func init_mod() -> void:
	print("Init achievement mod")
	
	# Define a new background
	var background_def: BackgroundDef = BackgroundDef.new({
		# Setting "locked" to true will mean that this is linked to an achievement
		"locked": true,
		"all_weapons": false,
		"description": ["Good luck!"],
		"icon": "res://assets/sprites/player/character-default.png",
		# The "key" property is used to instantiate the background, it refers to a registered class
		"key": "HardModeBackground",
		"title": "Hard Mode",
		"weapons": []
	})
	
	# Adds this background to the list of backgrounds
	DefHandler.add_background(background_def)
	
	# Add the new background to the cache of classes
	# This will be used to instantiate the class when selected
	ClassRegistry.register("HardModeBackground", "res://AchievementMod/HardModeBackground.gd")
	
	# Define a new achievement
	var achievement_def: AchievementDef = AchievementDef.new({
		# The "%s" will be replaced with the current progress to completing this achievement
		"description": "Kill %s enemies",
		# This key has to be the same as the one in the background
		"key": "HardModeBackground",
		# Goal to complete this achievement
		"target": 10,
		# Used to find which related def this achievement refers to 
		"type": AchievementDef.Ref.BackgroundRef
	})
	
	# Add the achievement to list of achievements
	DefHandler.add_achievement(achievement_def)
	
	# Connect to a signal to update this achievement progress
	# Needs to be an anonymous function since this script will be unloaded
	# so you cannot do something like EnemySpawner.enemy_dead.connect(_on_enemy_dead) where
	# _on_enemy_dead would be defined in this file
	EnemySpawner.enemy_dead.connect(func(_enemy: Enemy) -> void:
		# Updates the achievement progress by 1, it will automatically unlock when the target is reached
		AchievementManager._update("HardModeBackground", 1)
	)
