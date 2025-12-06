extends BaseMod


func init_mod() -> void:
    print("Init sound mod")
    
    AudioManager.add_sound("Priority", "mod/pop", -10.0, "res://SoundMod/pop-423717.mp3")
    
    EventBus.pickup_collected.connect(func(_pickup: Pickup) -> void:
        print('Playing mod sound')
        AudioManager.play("mod/pop")
    )
