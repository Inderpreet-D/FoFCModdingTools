extends BaseMod


func init_mod() -> void:
	print("Init weapon mod")
	
	# Define a new weapon
	var weapon_def: WeaponDef = WeaponDef.new({
		"description": [
			"Throw a spear",
			# These are mostly generated from the level_deltas
			# These represent the actual change that is seen by the player
			{
				"base": {},
				"tags": []
			},
			{
				"base": {},
				"tags": []
			},
			{
				"base": {},
				"tags": []
			}
		],
		"icon": "res://assets/sprites/enemy/aztec/aztec-spear-projectile.png",
		# The "key" should be unique, it is used by background to select what weapon choices are available
		"key": "spear",
		# Applied by the game when a weapon is leveled up to a certain level
		# The first delta is applied when the weapon is selected by the player
		"level_deltas": [
			{
				# Damage and delay are set to the level indicated by this value
				"damage": 10.0,
				"delay": 2.0,
				# Tags that get added, "removed_tags" is also a property that can be used
				"added_tags": ["Throwing", "LongRange", "SingleShot"]
			},
			{
				"damage": 15.0
			},
			{
				"delay": 4.0
			},
			{
				"delay": 16.0,
			}
		],
		# The "scene" is the path to the scene that will be instantiated when this weapon is chosen
		"scene": "res://WeaponMod/spear_spawner/SpearSpawner.tscn",
		"title": "Spear",
		# Max level ascensions, behaviour is controlled in code
		"variants": [
			{
				"text": "Throw more",
				"title": "Polydextrous"
			},
			{
				"text": "Spears orbit themselves",
				"title": "Gravity Spear"
			}
		]
		}
	)
	
	# Add weapon to the list
	DefHandler.add_weapon(weapon_def)
	
	# Define a new background
	var background_def: BackgroundDef = BackgroundDef.new({
		"all_weapons": false,
		"description": ["Starts with the spear"],
		"icon": "res://assets/sprites/player/character-default.png",
		# The "key" must match a registered class
		"key": "SpearBackground",
		"title": "Spear Guy",
		# This background only has the modded spear weapon as an option
		"weapons": ["spear"]
	})
	
	# Add the background to the list of exsting backgrounds
	DefHandler.add_background(background_def)
	
	# Register the new background
	ClassRegistry.register("SpearBackground", "res://WeaponMod/SpearBackground.gd")
	
	# Add the spear projectile to the NodePool
	NodePool.scenes.set("ModSpear", load("res://WeaponMod/spear/ModSpear.tscn"))
