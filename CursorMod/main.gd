extends BaseMod


func init_mod() -> void:
    print("Init cursor mod now")
    
    # Godot will throw an error when using load() to load this image since it is in a mod
    # This still throws a warning but that is fine
    var cursor_texture: Image = Image.load_from_file("res://CursorMod/cursor.png")
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
