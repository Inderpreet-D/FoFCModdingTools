extends PlayBase


# Used to modify each wave of the level that was chosen
func modify_wave(wave: EnemyWave) -> EnemyWave:
	var modified: EnemyWave = super.modify_wave(wave)
	
	# Sets spawn capacity which controls the maximum number of enemies that can spawn per wave
	modified.capacity *= 4.0
	modified.available_capacity *= 4.0
	
	if modified.condition == EnemyWave.NextCondition.KillsCond:
		# Decrease the number of kills needed to finish this wave by a factor of 4
		modified.kills_needed = floori(modified.kills_needed / 4.0)
		return modified
	
	# Make the wave take 20 times less time as normal
	modified.time_needed /= 20.0
	
	return modified


func _ready() -> void:
	print("Hyper game mode ready")
	
	super._ready()
	
	# Controls how long the game should last
	timer.max_time_seconds = 1 * 60
