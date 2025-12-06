extends BaseMod


const SOUND_NAME: String = "mod/pop"


func init_mod() -> void:
	print("Init sound mod")
	
	# Register sound with AudioManager
	# Define with bus, name, volume, and path
	AudioManager.add_sound("Priority", SOUND_NAME, -10.0, "res://SoundMod/pop-423717.mp3")
	
	# Play the sound when a pickup gets collected
	EventBus.pickup_collected.connect(func(_pickup: Pickup) -> void:
		print("Playing mod sound")
		AudioManager.play(SOUND_NAME)
	)
