extends BaseMod


const MOD_NAME: String = "ActiveMod"


func _update_mod_settings() -> void:
	ModLoader.config.update_setting(MOD_NAME, ModConfigSetting.new({
		id = "active-key",
		name = "Active key",
		default_value = "R"
	}))


func init_mod() -> void:
	print("Init active mod")
	
	_update_mod_settings()
	
	var manager_scene: PackedScene = load("res://ActiveMod/active_manager/ActiveManager.tscn")
	Global.add_child(manager_scene.instantiate())
