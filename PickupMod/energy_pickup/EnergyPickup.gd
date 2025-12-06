extends Pickup


# Called when this node is freed and re-added to the NodePool
func reset() -> void:
	super.reset()
	
	# Reset modified values
	value = 1.0
	speed = 500.0
	catch_squared_distance = 16.0


# Called when the player gets this pickup
func on_pickup() -> void:
	super.on_pickup()
	
	print("Picked up energy")
	
	# Trigger every weapon to attack, with a small delay
	for player: Player in Utilities.get_all_players():
		for _i: int in 10:
			for weapon: Weapon in player.get_weapon_nodes():
				weapon.attack()
			
			await Utilities.wait(0.1)
