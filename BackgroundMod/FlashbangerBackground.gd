class_name FlashbangerBackground extends Background


# Called by registered signal when an enemy dies
func _on_enemy_dead(enemy: Enemy) -> void:
	# Get an instance of an "Explosion" from the NodePool
	var explosion: Explosion = NodePool.create_node("Explosion")
	
	# Center the explosion on the enemy
	explosion.global_position = enemy.global_position
	
	# Arbitrary, but low damage and large radius
	explosion.damage = 2.0
	explosion.max_radius = 1030.0
	
	# Pretty fast size increase
	explosion.expansion_rate_modifier = 20.0 / 1.5
	
	# This lets any passives that the player has affect the explosion parameters
	Passives.modify_projectile(explosion)
	
	# If the explosion instance still is mounted then we cannot re-add
	# it to the tree or the game will crash
	if is_instance_valid(explosion.get_parent()):
		return
	
	# Add the explosion to the scene tree
	var bullet_holder: Node = _player.get_tree().get_first_node_in_group("bullets")
	bullet_holder.call_deferred("add_child", explosion)


# Called when the background is first added to the player
func assign(player: Player) -> void:
	super.assign(player)
	
	# Add signal connection
	EnemySpawner.enemy_dead.connect(_on_enemy_dead)


# Called when the background is removed from the player
func unassign() -> void:
	super.unassign()
	
	# Remove signal connection
	EnemySpawner.enemy_dead.disconnect(_on_enemy_dead)
