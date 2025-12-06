extends BaseMod


func init_mod() -> void:
    print("Init CRT shader mod")
    
    var scene: PackedScene = load("res://CRTShaderMod/node/ShaderOverlay.tscn")
    var instance: CanvasLayer = scene.instantiate()
    ModLoader.add_child(instance)
