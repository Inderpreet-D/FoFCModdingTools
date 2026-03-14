extends "res://ActiveMod/base_active_item/BaseActiveItem.gd"


func setup(player: Player) -> void:
	_charge_time = 30.0
	
	super.setup(player)


func activate() -> void:
	super.activate()
	
	await Utilities.wait(6.0)
	
	var all_enemies: Array[Node] = Utilities.get_all_enemies()
	all_enemies = all_enemies.filter(func(enemy: Enemy) -> bool:
		return enemy is not Boss
	)
	all_enemies.sort_custom(func(a: Enemy, b: Enemy) -> bool:
		return a.health > b.health
	)
	if all_enemies.size() > 6:
		all_enemies = all_enemies.slice(0, 6)
	
	for enemy: Enemy in all_enemies:
		var atk: Attack = Attack.new(enemy.max_health)
		enemy.take_damage(atk)
