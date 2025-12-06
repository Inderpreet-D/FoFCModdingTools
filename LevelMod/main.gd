extends BaseMod


func init_mod() -> void:
    print("Init level mod")
    
    var def: LevelDef = LevelDef.new({
        "description": "The poison swamp level.",
        "icon": "res://LevelMod/level-swamp.png",
        "key": "swamp",
        "level_path": "res://LevelMod/level/Level.tscn",
        "map": {
            "focus": ["left"],
            "icon": "res://LevelMod/map-swamp.png",
            "position": {
                "x": 25,
                "y": 470
            }
        },
        "title": "Swamp"
    })
    
    DefHandler.add_level(def)
    
    NodePool.scenes.set("Slime", load("res://LevelMod/slime/SlimeEnemy.tscn"))
