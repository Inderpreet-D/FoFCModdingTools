extends Level


func _update_config_waves(config: LevelConfig) -> void :
    const pool_1: Array[String] = ["FishKeeper", "Warrior", "SpearThrower"]
    const pool_2: Array[String] = ["Worshipper", "Shaman"]
    const pool_3: Array[String] = ["Congregation", "Pope"]
    const base_unit_seconds: int = 60
    const wave_time: int = base_unit_seconds * 2
    const boss_time: int = base_unit_seconds * 1

    config.waves = [
        EnemyWave.new(false, wave_time, pool_1), 
        EnemyWave.new(false, wave_time, pool_1 + pool_2), 
        EnemyWave.new(false, boss_time, ["Boss"]), 

        EnemyWave.new(false, wave_time, pool_2), 
        EnemyWave.new(false, wave_time, pool_2 + pool_3), 
        EnemyWave.new(false, boss_time, ["Boss"]), 

        EnemyWave.new(false, wave_time, pool_3), 
        EnemyWave.new(false, wave_time, pool_1 + pool_1 + pool_2 + pool_3 + pool_3), 
        EnemyWave.new(false, boss_time, ["Boss"]), 

        EnemyWave.new(false, wave_time, pool_1 + pool_2 + pool_3), 
        EnemyWave.new(false, boss_time, ["Boss"]), 


        EnemyWave.new(false, 60, pool_1 + pool_2 + pool_3)
    ]


func _update_config(config: LevelConfig) -> void :
    super._update_config(config)

    _update_config_waves(config)
    config.bosses = Bosses.get_bosses()
