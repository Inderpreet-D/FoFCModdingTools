extends PlayBase


func modify_wave(wave: EnemyWave) -> EnemyWave:
    var modified: EnemyWave = super.modify_wave(wave)

    if modified.condition == EnemyWave.NextCondition.KillsCond:
        modified.kills_needed = floori(modified.kills_needed / 4.0)
        return modified

    modified.time_needed /= 20.0
    return modified


func _modify_config(config: LevelConfig) -> void :
    super._modify_config(config)

    config._spawn_capacity *= 4.0
    config.normal_capacity_change *= 3.0
    config.empty_capacity_change *= 3.0


func _ready() -> void :
    print("Hyper game mode readied")
    
    super._ready()

    timer.max_time_seconds = 1 * 60
