extends BaseMod


func init_mod() -> void:
	print("Init shop mod")
	
	# Define a new shop upgrade
	var size_up: ShopUpgrade = ShopUpgrade.new({
		name = "Size Up",
		description = "Increase Size",
		default_value = 1.0,
		cost = [75, 125, 175, 225],
		value = [1.5, 2.0, 2.5, 3.0],
		_type = "float",
		# Tier in the shop, 0 is the first shelf
		treeID = 0,
		lore = [
			"I am quite imposing",
			"But I could be bigger",
			"Bigger still",
			"They say I may be too big",
		]
	})
	
	# Add the upgrade to the library
	ShopData.add_upgrade("size-multiplier", size_up)
	
	# Define a new shop upgrade
	var size_down: ShopUpgrade = ShopUpgrade.new({
		name = "Size Down",
		description = "Reduce Size",
		default_value = 1.0,
		cost = [75, 125, 175, 225],
		value = [1.0 / 1.5, 1.0 / 2.0, 1.0 / 2.5, 1.0 / 3.0],
		_type = "float",
		# Tier in the shop, 0 is the first shelf
		treeID = 0,
		lore = [
			"They say I may be too big",
			"A little smaller",
			"But I could be smaller still",
			"I am quite small",
		]
	})
	
	# Add the upgrade to the library
	ShopData.add_upgrade("size-multiplier-down", size_down)
	
	# Add callback for when the player is first spawned
	EventBus.player_spawned.connect(func(player: Player) -> void:
		# Get the values of both size modifiers
		var size_mult: float = ShopData.get_upgrade("size-multiplier")
		var size_mult_down: float = ShopData.get_upgrade("size-multiplier-down")
		
		# Scale the player based on both size multipliers
		# At max level they both cancel out
		var total_size_mult: float = size_mult * size_mult_down
		player.scale *= total_size_mult
	)
