extends Pickup


func reset() -> void :
    super.reset()

    value = 1.0
    speed = 500.0
    catch_squared_distance = 16.0


func on_pickup() -> void :
    super.on_pickup()
    
    print("Picked up energy")
    
    for player: Player in Utilities.get_all_players():
        for _i: int in 10:
            for weapon: Weapon in player.get_weapon_nodes():
                weapon.attack()
            
            await Utilities.wait(0.1)
