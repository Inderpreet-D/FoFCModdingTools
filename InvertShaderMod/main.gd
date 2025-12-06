extends BaseMod


func init_mod() -> void:
	print("Init invert shader mod")
	
	# Add overlay node
	var scene: PackedScene = load("res://InvertShaderMod/node/InvertOverlay.tscn")
	var instance: CanvasLayer = scene.instantiate()
	ModLoader.add_child(instance)
