extends Level


func _update_config_waves(config: LevelConfig) -> void :
    const pool_1: Array[String] = [
        "Pigeon", "Crow", "Kestrel", "Hawk",
        "Cop", "Baton", "FBI", "CIA"
    ]
    const pool_2: Array[String] = [
        "FishKeeper", "Worshipper", "Congregation", "Pope",
        "Weeb1", "Weeb2", "Idol", "Ex1", "Ex2", "Ex3", "Ex4", "Generic1", "Generic2", "Generic3"
    ]
    const pool_3: Array[String] = [
        "Warrior", "Shaman", "SpearThrower",
        "FireTrainee", "WindMagician", "EarthWizard"
    ]
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
