extends BaseMod


func init_mod() -> void:
	print("Init CRT shader mod")
	
	# Load and instantiate the shader
	var scene: PackedScene = load("res://CRTShaderMod/node/CRTOverlay.tscn")
	var instance: CanvasLayer = scene.instantiate()
	
	# Add the shader to the tree
	ModLoader.add_child(instance)
