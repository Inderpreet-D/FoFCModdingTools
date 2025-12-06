extends BaseMod


func init_mod() -> void:
    print("Init weapon mod")
    
    var weapon_def: WeaponDef = WeaponDef.new({
        "description": [
            "Throw a spear",
            {
                "base": {
                    "damage": 5.0
                },
                "tags": []
            },
            {
                "base": {
                    "delay": 2.0
                },
                "tags": []
            },
            {
                "base": {
                    "delay": 12.0
                },
                "tags": []
            }
        ],
        "icon": "res://assets/sprites/enemy/aztec/aztec-spear-projectile.png",
        "key": "spear",
        "level_deltas": [
            {
                "damage": 10.0,
                "delay": 2.0,
                "added_tags": ["Throwing", "LongRange", "SingleShot"]
            },
            {
                "damage": 15.0
            },
            {
                "delay": 4.0
            },
            {
                "delay": 16.0,
            }
        ],
        "scene": "res://WeaponMod/spear_spawner/SpearSpawner.tscn",
        "title": "Spear",
        "variants": [
            {
                "text": "Throw more",
                "title": "Polydextrous"
            },
            {
                "text": "Spears orbit themselves",
                "title": "Gravity Spear"
            }
        ]
        }
    )
    DefHandler.add_weapon(weapon_def)
    
    var background_def: BackgroundDef = BackgroundDef.new({
        "all_weapons": false,
        "description": ["Starts with the spear"],
        "icon": "res://assets/sprites/player/character-default.png",
        "key": "SpearBackground",
        "title": "Spear Guy",
        "weapons": ["spear"]
    })
    DefHandler.add_background(background_def)
    ClassRegistry.register("SpearBackground", "res://WeaponMod/SpearBackground.gd")
    
    NodePool.scenes.set("ModSpear", load("res://WeaponMod/spear/ModSpear.tscn"))
