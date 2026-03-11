extends BaseMod


const MOD_NAME: String = "ActiveMod"


# Adds keys that th user can then use to trigger active itmes
func _add_input_events() -> void:
	var action_name: String = "use_active_item"
	InputMap.add_action(action_name)
	
	var keyboard_event: InputEventKey = InputEventKey.new()
	keyboard_event.keycode = DisplayServer.keyboard_get_keycode_from_physical(Key.KEY_F)
	InputMap.action_add_event(action_name, keyboard_event)
	
	var controller_event: InputEventJoypadButton = InputEventJoypadButton.new()
	controller_event.button_index = JOY_BUTTON_LEFT_SHOULDER
	InputMap.action_add_event(action_name, controller_event)


# TODO Load these from a JSON file
func _modify_background_descriptions() -> void:
	for key: String in DefHandler.backgrounds:
		var def: BackgroundDef = DefHandler.backgrounds[key]
		var item_name: String = "healing"
		def._description += "\n%s" % def.build_description(["+Starts with %s active item" % item_name])


func init_mod() -> void:
	print("Init active mod")
	
	_add_input_events()
	
	_modify_background_descriptions()
	
	var manager_scene: PackedScene = load("res://ActiveMod/active_manager/ActiveManager.tscn")
	Global.add_child(manager_scene.instantiate())
