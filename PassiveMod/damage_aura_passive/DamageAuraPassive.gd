class_name DamageAuraPassive extends Passive


const DAMAGE_TIMEOUT: float = 2.0


var _elapsed_time: float = 0.0


# Called when this class is instantiated
func _init() -> void:
	super._init()
	
	# Needs to match the name of this class
	effect_name = "DamageAuraPassive"


# Called when this passive if first added to the player
func on_attach() -> void:
	super.on_attach()
	
	if _player.has_node("Aura"):
		print("DamageAuraPassive node exists")
		return
	
	# Add the aura node to the player if they do not have it
	var aura_scene: PackedScene = load("res://PassiveMod/damage_aura_passive/Aura.tscn")
	var aura: Node2D = aura_scene.instantiate()
	_player.add_child(aura, true)
	print("DamageAuraPassive node added")


# Called every frame
func process(delta: float) -> bool:
	var result: bool = super.process(delta)
	
	_elapsed_time += delta
	if _elapsed_time < DAMAGE_TIMEOUT:
		return result
	
	_elapsed_time = 0.0
	
	# Find average damage of all weapons
	var damage: float = 0.0
	var weapons: Array[Weapon] = _player.get_weapon_nodes()
	for weapon: Weapon in weapons:
		damage += weapon.damage
	damage /= weapons.size()
	
	# Attack all enemies in a radius around the player
	for enemy: Enemy in Utilities.get_enemies_near(_player.global_position, 150.0):
		var atk: Attack = Attack.new(damage)
		enemy.take_damage(atk)
	
	return result
