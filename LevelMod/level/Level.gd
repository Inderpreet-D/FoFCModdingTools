extends Level


# Sets waves for a level
func _update_config_waves(config: LevelConfig) -> void:
	# Each element of these refers to a key of the NodePool
	const pool_1: Array[String] = [
		"Slime", # Added custom enemy
		"Pigeon", "Crow", "Kestrel", "Hawk",
		"Cop", "Baton", "FBI", "CIA"
	]
	const pool_2: Array[String] = [
		"Slime", # Added custom enemy
		"FishKeeper", "Worshipper", "Congregation", "Pope",
		"Weeb1", "Weeb2", "Idol", "Ex1", "Ex2", "Ex3", "Ex4", "Generic1", "Generic2", "Generic3"
	]
	const pool_3: Array[String] = [
		"Slime", # Added custom enemy
		"Warrior", "Shaman", "SpearThrower",
		"FireTrainee", "WindMagician", "EarthWizard"
	]
	
	# Base constants for wave and boss time
	const base_unit_seconds: int = 60
	const wave_time: int = base_unit_seconds * 2
	const boss_time: int = base_unit_seconds * 1
	
	config.waves = [
		# Two waves of enemies followed by a boss
		EnemyWave.new(false, wave_time, pool_1),
		EnemyWave.new(false, wave_time, pool_1 + pool_2),
		EnemyWave.new(false, boss_time, ["Boss"]),
		
		# Two waves of enemies followed by a boss
		EnemyWave.new(false, wave_time, pool_2),
		EnemyWave.new(false, wave_time, pool_2 + pool_3),
		EnemyWave.new(false, boss_time, ["Boss"]),
		
		# Two waves of enemies followed by a boss
		EnemyWave.new(false, wave_time, pool_3),
		EnemyWave.new(false, wave_time, pool_1 + pool_1 + pool_2 + pool_3 + pool_3),
		EnemyWave.new(false, boss_time, ["Boss"]),
		
		# One wave of enemies followed by a boss
		EnemyWave.new(false, wave_time, pool_1 + pool_2 + pool_3),
		EnemyWave.new(false, boss_time, ["Boss"]),
		
		# Wave of enemies that continues until the end of the game
		# Adds more enemy capacity after every minute
		EnemyWave.new(false, 60, pool_1 + pool_2 + pool_3)
	]


# Called when the level is first being setup
func _update_config(config: LevelConfig) -> void:
	super._update_config(config)
	
	# Sets waves for a level
	_update_config_waves(config)
	
	# Sets boss pool for a level
	config.bosses = Bosses.get_bosses()
