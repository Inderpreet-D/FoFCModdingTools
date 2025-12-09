extends BaseMod


const SOUND_NAME: String = "mod/pop"
const MOD_NAME: String = "SoundMod"


func _update_mod_info() -> void:
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "name",
		name = "Name",
		value = "Sound Mod"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "version",
		name = "Version",
		value = "1.0.0"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "description",
		name = "Version",
		value = "Adds a new sound when collecting a pickup"
	}))


func init_mod() -> void:
	print("Init sound mod")
	
	_update_mod_info()
	
	# Register sound with AudioManager
	# Define with bus, name, volume, and path
	AudioManager.add_sound({
		name = SOUND_NAME,
		volume = -10.0,
		path = "res://SoundMod/pop-423717.mp3"
	})
	
	# Play the sound when a pickup gets collected
	EventBus.pickup_collected.connect(func(_pickup: Pickup) -> void:
		print("Playing mod sound")
		AudioManager.play(SOUND_NAME)
	)
