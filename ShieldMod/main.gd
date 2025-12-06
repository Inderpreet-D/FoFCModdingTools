extends BaseMod


func init_mod() -> void:
    print("Init shield mod")
    
    var def: ShieldDef = ShieldDef.new({
        "description": "Stops projectiles when <broken>",
        "icon": "res://ShieldMod/sprite.png",
        "key": "EMPShield",
        "tier": 1,
        "title": "EMP Shield"
    })
    DefHandler.add_shield(def)
    
    ClassRegistry.register("EMPShield", "res://ShieldMod/EMPShield.gd")
