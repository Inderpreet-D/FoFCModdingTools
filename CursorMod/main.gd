extends BaseMod


func init_mod() -> void:
	print("Init cursor mod now")
	
	var cursor_texture: Texture2D = load("res://CursorMod/cursor.png")
	Input.set_custom_mouse_cursor(cursor_texture)
	
	for _i: int in 3:
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
		await Utilities.wait(0.2)
		
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		await Utilities.wait(0.2)
	
	print("Adding cursor mod node")
	var node_scene: PackedScene = load("res://CursorMod/node/Node.tscn")
	var node_instance: Node = node_scene.instantiate()
	ModLoader.add_child(node_instance)
