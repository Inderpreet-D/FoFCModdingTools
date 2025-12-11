extends BaseMod


const MOD_NAME: String = "CursorMod"


func _update_mod_settings() -> void:
	ModLoader.config.update_setting(MOD_NAME, ModConfigSetting.new({
		id = "should-blink",
		name = "Should the cursor occasionally blink?",
		default_value = true
	}))


func init_mod() -> void:
	print("Init cursor mod")
	
	_update_mod_settings()
	
	# Godot will throw an error when using load() to load this image since it is in a mod
	# This still throws a warning but that is fine
	var cursor_texture: Image = Image.load_from_file("res://CursorMod/cursor.png")
	var image_size: Vector2 = Vector2(36.0, 28.0)
	Input.set_custom_mouse_cursor(cursor_texture, Input.CURSOR_ARROW, image_size / 2.0)
	ProjectSettings.set_setting("display/mouse_cursor/tooltip_position_offset", image_size + Vector2(10.0, 10.0))
	
	# Called when mod settings have been loaded, happens after all the init_mod functions are called
	ModLoader.mod_config_loaded.connect(func() -> void:
		# Get setting
		var should_blink: bool = ModLoader.config.get_setting_value(MOD_NAME, "should-blink")
		
		# Name of existing node
		var node_name: String = "%sBlinkNode" % MOD_NAME
		
		# Remove exising node if it exists
		var existing_node: Node = ModLoader.get_node_or_null("/root/%s" % node_name)
		if existing_node:
			existing_node.queue_free()
			ModLoader.remove_child(existing_node)
		
		if not should_blink:
			print("Blinking node removed")
			return
		
		# Instance and add node to scene
		print("Adding cursor mod node")
		var node_scene: PackedScene = load("res://CursorMod/node/Node.tscn")
		var node_instance: Node = node_scene.instantiate()
		node_instance.name = node_name
		ModLoader.add_child(node_instance, true)
		print("Blinking node added")
	)
