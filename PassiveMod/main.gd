extends BaseMod


func init_mod() -> void:
    print("Init passive mod")
    
    var passive_def: PassiveDef = PassiveDef.new({
        "description": "Gain a damaging aura",
        "icon": "res://PassiveMod/damage_aura_passive/sprite.png",
        "key": "DamageAuraPassive",
        "title": "Damage Aura"
    })
    DefHandler.add_passive(passive_def)
    ClassRegistry.register("DamageAuraPassive", "res://PassiveMod/damage_aura_passive/DamageAuraPassive.gd")
    
    var boss_passive_def: PassiveDef = PassiveDef.new({
        "description": "Toki wo tomare",
        "icon": "res://PassiveMod/boss_world_passive/sprite.png",
        "key": "BossWorldPassive",
        "title": "The World"
    })
    DefHandler.add_boss_passive(boss_passive_def)
    ClassRegistry.register("BossWorldPassive", "res://PassiveMod/boss_world_passive/BossWorldPassive.gd")
