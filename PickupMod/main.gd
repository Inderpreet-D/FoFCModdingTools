extends BaseMod


const ENERGY_KEY: String = "energy_pickup"


func init_mod() -> void:
	print("Init pickup mod")
	
	# Add to node pool
	NodePool.scenes[ENERGY_KEY] = load("res://PickupMod/energy_pickup/EnergyPickup.tscn")
	
	# Add function that will be triggered when an enemy dies
	PickupHandler.drop_handlers.append(func(enemy: Enemy) -> Pickup:
		# 5% chance to drop, increases by 5% per luck upgrade
		var can_spawn: bool = randf_range(0.0, 100.0) <= Stats.luck * 5.0
		if not can_spawn:
			return null
		
		print("Dropped energy")
		# Create or get instance of this node from the NodePool
		var energy_pickup: Pickup = NodePool.create_node(ENERGY_KEY)
		energy_pickup.global_position = enemy.global_position
		return energy_pickup
	)
