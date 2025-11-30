extends BaseMod


func init_mod() -> void:
	var scene: PackedScene = load("res://ShaderMod/node/ShaderOverlay.tscn")
	var instance: CanvasLayer = scene.instantiate()
	ModLoader.add_child(instance)
