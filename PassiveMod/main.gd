extends BaseMod


const MOD_NAME: String = "PassiveMod"


func _update_mod_info() -> void:
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "name",
		name = "Name",
		value = "Passive Mod"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "version",
		name = "Version",
		value = "1.0.0"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "description",
		name = "Version",
		value = "Adds a new passive (Damage Aura) and a new boss passive (The World)"
	}))


func init_mod() -> void:
	print("Init passive mod")
	
	_update_mod_info()
	
	# Define a new passive
	var passive_def: PassiveDef = PassiveDef.new({
		"description": "Gain a damaging aura",
		"icon": "res://PassiveMod/damage_aura_passive/sprite.png",
		# The "key" property needs to point a class
		"key": "DamageAuraPassive",
		"title": "Damage Aura"
	})
	
	# Add passive to existing list of passives
	DefHandler.add_passive(passive_def)
	
	# Register the passive so it can be instantiated later when chosen
	ClassRegistry.register("DamageAuraPassive", "res://PassiveMod/damage_aura_passive/DamageAuraPassive.gd")
	
	# Define a new passive
	var boss_passive_def: PassiveDef = PassiveDef.new({
		"description": "Toki wo tomare",
		"icon": "res://PassiveMod/boss_world_passive/sprite.png",
		# The "key" property needs to point a class
		"key": "BossWorldPassive",
		"title": "The World"
	})
	
	# Add boss passive to existing list of boss passives
	DefHandler.add_boss_passive(boss_passive_def)
	
	# Register the boss passive so it can be instantiated later when chosen
	ClassRegistry.register("BossWorldPassive", "res://PassiveMod/boss_world_passive/BossWorldPassive.gd")
