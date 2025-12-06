extends BaseMod


func init_mod() -> void:
	print("Init edge shader mod, first version")
	
	# Add node to scene
	var scene: PackedScene = load("res://EdgeShaderMod/node/EdgeShader.tscn")
	var instance: CanvasLayer = scene.instantiate()
	ModLoader.add_child(instance)
