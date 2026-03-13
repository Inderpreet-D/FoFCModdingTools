extends "res://ActiveMod/base_active_item/BaseActiveItem.gd"


func setup(player: Player) -> void:
	_charge_time = 1.0
	
	super.setup(player)


func _create_explosion() -> Explosion:
	var damage: float = _player.max_health * 5.0
	var explosion_radius: float = 650.0
	explosion_radius = _player.background.modify_explosion_radius(explosion_radius)
	
	var explosion: Explosion = NodePool.create_node("Explosion")
	explosion.global_position = _player.global_position
	explosion.max_radius = explosion_radius
	explosion.expansion_rate_modifier = 1.5
	explosion.damage = damage
	explosion.damage *= _player.damage_multiplier
	
	Passives.modify_projectile(explosion)
	
	return explosion


func activate() -> void:
	super.activate()
	
	var explosion: Explosion = _create_explosion()
	
	if is_instance_valid(explosion.get_parent()):
		return
	
	var bullet_holder: Node = _player.get_tree().get_first_node_in_group("bullets")
	bullet_holder.call_deferred("add_child", explosion)
	
	if _player.health >= 2.0:
		var atk: Attack = Attack.new(_player.health / 2.0)
		_player.take_damage(atk)
