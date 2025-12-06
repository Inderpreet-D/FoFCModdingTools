extends BaseMod


func init_mod() -> void:
    print("Init shop mod")
    
    var size_up: ShopUpgrade = ShopUpgrade.new(
        "Size Up", "Increase Size", 1.0, 
        [75, 125, 175, 225], 
        [1.5, 2.0, 2.5, 3.0], 
        "float", 
        0, 
        [
            "I am quite imposing", 
            "But I could be bigger", 
            "Bigger still", 
            "They say I may be too big", 
        ]
    )
    ShopData.add_upgrade("size-multiplier", size_up)
    
    var size_down: ShopUpgrade = ShopUpgrade.new(
        "Size Down", "Reduce Size", 1.0, 
        [75, 125, 175, 225], 
        [1.0 / 1.5, 1.0 / 2.0, 1.0 / 2.5, 1.0 / 3.0], 
        "float", 
        0, 
        [
            "They say I may be too big", 
            "A little smaller", 
            "But I could be smaller still", 
            "I am quite small", 
        ]
    )
    ShopData.add_upgrade("size-multiplier-down", size_down)
    
    EventBus.player_spawned.connect(func(player: Player) -> void:
        var size_mult: float = ShopData.get_upgrade("size-multiplier")
        var size_mult_down: float = ShopData.get_upgrade("size-multiplier-down")
        var total_size_mult: float = size_mult * size_mult_down
        player.scale *= total_size_mult
    )
