extends BaseMod


func init_mod() -> void:
    print("Init level mod")
    
    var def: LevelDef = LevelDef.new({
        "description": "The poison swamp level.",
        "icon": "res://LevelMod/level-swamp.png",
        "key": "swamp",
        "level_path": "res://LevelMod/level/Level.tscn",
        "map": {
            "focus": ["top"],
            "icon": "res://LevelMod/map-swamp.png",
            "position": {
                "x": 25,
                "y": 470
            }
        },
        "title": "Swamp"
    })
    
    DefHandler.levels.set(def._key, def)
