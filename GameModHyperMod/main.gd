extends BaseMod


func init_mod() -> void:
    print("Init game mode mod now")
    
    var def: GameModeDef = GameModeDef.new({
        "description": "1 minute run with the same amount of bosses and enemies as the standard mode",
        "icon": "res://assets/sprites/ui/game_mode/game_mode_normal.png",
        "key": "hyper_mod",
        "scene": "res://GameModHyperMod/mode/PlayHyper.tscn",
        "title": "Hyper Mode"
    })
    
    # Add new game mode
    DefHandler.game_modes.set(def._key, def)
