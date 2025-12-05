extends BaseMod


func init_mod() -> void:
    print("Init achievement mod now")
    
    var background_def: BackgroundDef = BackgroundDef.new({
        "locked": true,
        "all_weapons": false,
        "description": ["Good luck!"],
        "icon": "res://assets/sprites/player/character-default.png",
        "key": "HardModeBackground",
        "title": "Hard Mode",
        "weapons": []
    })
    DefHandler.add_background(background_def)
    ClassRegistry.register("HardModeBackground", "res://AchievementMod/HardModeBackground.gd")
    
    var achievement_def: AchievementDef = AchievementDef.new({
        "description": "Kill %s enemies",
        "key": "HardModeBackground",
        "target": 10,
        "type": AchievementDef.Ref.BackgroundRef
    })
    DefHandler.add_achievement(achievement_def)
    
    EnemySpawner.enemy_dead.connect(func(_enemy: Enemy) -> void:
        AchievementManager._update("HardModeBackground", 1)
    )
