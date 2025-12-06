extends BaseMod


func init_mod() -> void:
    print("Init edge shader mod, second version")
    
    # Add overlay to scene
    var scene: PackedScene = load("res://EdgeShader2Mod/node/Edge2Overlay.tscn")
    var instance: CanvasLayer = scene.instantiate()
    ModLoader.add_child(instance)
