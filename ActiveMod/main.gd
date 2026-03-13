extends BaseMod


const MOD_NAME: String = "ActiveMod"


# Adds keys that th user can then use to trigger active itmes
func _add_input_events() -> void:
	var action_name: String = "use_active_item"
	InputMap.add_action(action_name)
	
	for key: Key in [Key.KEY_F, Key.KEY_J, Key.KEY_K]:
		var keyboard_event: InputEventKey = InputEventKey.new()
		keyboard_event.keycode = DisplayServer.keyboard_get_keycode_from_physical(key)
		InputMap.action_add_event(action_name, keyboard_event)
	
	var controller_event: InputEventJoypadButton = InputEventJoypadButton.new()
	controller_event.button_index = JOY_BUTTON_LEFT_SHOULDER
	InputMap.action_add_event(action_name, controller_event)


func init_mod() -> void:
	print("Init active mod")
	
	_add_input_events()
	
	var manager_scene: PackedScene = load("res://ActiveMod/active_manager/ActiveManager.tscn")
	Global.add_child(manager_scene.instantiate())
