extends BaseMod


const ENERGY_KEY: String = "energy_pickup"


func init_mod() -> void:
    print("Init pickup mod")
    
    NodePool.scenes[ENERGY_KEY] = load("res://PickupMod/energy_pickup/EnergyPickup.tscn")
    
    PickupHandler.drop_handlers.append(func(enemy: Enemy) -> Pickup:
        var can_spawn: bool = randf_range(0.0, 100.0) <= Stats.luck * 5.0
        if not can_spawn:
            return null
        
        print("Dropped energy")
        var energy_pickup: Pickup = NodePool.create_node(ENERGY_KEY)
        energy_pickup.global_position = enemy.global_position
        return energy_pickup
    )
