extends BaseActiveItem


var _num_affected_enemies: int = 10


func setup(player: Player) -> void:
	_charge_time = 15.0
	
	super.setup(player)


func activate() -> void:
	super.activate()
	
	var all_enemies: Array[Node] = Utilities.get_all_enemies()
	all_enemies.shuffle()
	if all_enemies.size() > _num_affected_enemies:
		all_enemies = all_enemies.slice(0, _num_affected_enemies)
	
	for enemy: Enemy in all_enemies:
		var atk: Attack = Attack.new()
		var effects: Array[StatusEffect] = [
			BleedDebuff.new(), 
			BurnDebuff.new(), 
			FreezeDebuff.new(), 
			MadnessDebuff.new(), 
			PoisonDebuff.new(), 
			ShatterDebuff.new(), 
			ShockDebuff.new(), 
			MarkedDebuff.new(), 
		]
		var effect: StatusEffect = effects.pick_random()
		atk.add_effect(effect)
		enemy.take_damage(atk)
