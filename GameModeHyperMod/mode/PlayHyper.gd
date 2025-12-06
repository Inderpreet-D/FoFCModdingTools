extends PlayBase


# Used to modify each wave of the level that was chosen
func modify_wave(wave: EnemyWave) -> EnemyWave:
	var modified: EnemyWave = super.modify_wave(wave)
	
	if modified.condition == EnemyWave.NextCondition.KillsCond:
		# Decrease the number of kills needed to finish this wave by a factor of 4
		modified.kills_needed = floori(modified.kills_needed / 4.0)
	else:
		# Make the wave take 20 times less time as normal
		modified.time_needed /= 20.0
	
	return modified


# Used to modify the existing config for the level that was chosen
func _modify_config(config: LevelConfig) -> void:
	super._modify_config(config)
	
	# Sets initial capacity which controls the maximum number of enemies that can spawn
	config._spawn_capacity *= 4.0
	
	# These control how much the capacity should increase by after each wave
	# Empty is only used when there is no remaining capacity
	config.normal_capacity_change *= 3.0
	config.empty_capacity_change *= 3.0


func _ready() -> void:
	print("Hyper game mode ready")
	
	super._ready()
	
	# Controls how long the game should last
	timer.max_time_seconds = 1 * 60
