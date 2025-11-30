class_name FlashbangerBackground extends DefaultBackground


func _on_enemy_dead(enemy: Enemy) -> void:
	var explosion: Explosion = NodePool.create_node("Explosion")
	explosion.global_position = enemy.global_position
	explosion.damage = 2.0
	explosion.max_radius = 1030.0
	explosion.expansion_rate_modifier = 20.0 / 1.5
	Passives.modify_projectile(explosion)
	
	if is_instance_valid(explosion.get_parent()):
		return
	
	var bullet_holder: Node = _player.get_tree().get_first_node_in_group("bullets")
	bullet_holder.call_deferred("add_child", explosion)


func assign(player: Player) -> void:
	super.assign(player)
	
	EnemySpawner.enemy_dead.connect(_on_enemy_dead)


func unassign() -> void:
	super.unassign()
	
	EnemySpawner.enemy_dead.disconnect(_on_enemy_dead)
