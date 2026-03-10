extends BaseMod


const ENERGY_KEY: String = "energy_pickup"
const MOD_NAME: String = "PickupMod"


func _update_mod_settings() -> void:
	ModLoader.config.update_setting(MOD_NAME, ModConfigSetting.new({
		id = "base-drop-chance",
		name = "Base energy drop chance",
		default_value = 2.5
	}))
	
	ModLoader.config.update_setting(MOD_NAME, ModConfigSetting.new({
		id = "luck-effect",
		name = "Added chance for every luck",
		default_value = 5.0
	}))


func init_mod() -> void:
	print("Init pickup mod")
	
	_update_mod_settings()
	
	# Add to node pool
	NodePool.scenes[ENERGY_KEY] = load("res://PickupMod/energy_pickup/EnergyPickup.tscn")
	
	# Add function that will be triggered when an enemy dies
	PickupHandler.drop_handlers.append(func(enemy: Enemy) -> Pickup:
		var base_drop_chance: float = ModLoader.config.get_setting_value(MOD_NAME, "base-drop-chance")
		var luck_effect: float = ModLoader.config.get_setting_value(MOD_NAME, "luck-effect")
		
		if not PickupHandler._check_can_spawn(luck_effect, base_drop_chance):
			return null
		
		print("Dropped energy")
		# Create or get instance of this node from the NodePool
		var energy_pickup: Pickup = NodePool.create_node(ENERGY_KEY)
		energy_pickup.global_position = enemy.global_position
		return energy_pickup
	)
