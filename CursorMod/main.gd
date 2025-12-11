extends BaseMod


const MOD_NAME: String = "CursorMod"


func _update_mod_info() -> void:
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "name",
		name = "Name",
		value = "Cursor Mod"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "version",
		name = "Version",
		value = "1.0.0"
	}))
	
	ModLoader.config.update_info(MOD_NAME, ModConfigInfo.new({
		id = "description",
		name = "Version",
		value = "Replaces the normal cursor with a re-skinned, blinking one"
	}))


func init_mod() -> void:
	print("Init cursor mod")
	
	_update_mod_info()
	
	# Godot will throw an error when using load() to load this image since it is in a mod
	# This still throws a warning but that is fine
	var cursor_texture: Image = Image.load_from_file("res://CursorMod/cursor.png")
	var image_size: Vector2 = Vector2(36.0, 28.0)
	Input.set_custom_mouse_cursor(cursor_texture, Input.CURSOR_ARROW, image_size / 2.0)
	ProjectSettings.set_setting("display/mouse_cursor/tooltip_position_offset", image_size + Vector2(10.0, 10.0))
	
	# Instance and add node to scene
	print("Adding cursor mod node")
	var node_scene: PackedScene = load("res://CursorMod/node/Node.tscn")
	var node_instance: Node = node_scene.instantiate()
	ModLoader.add_child(node_instance)
