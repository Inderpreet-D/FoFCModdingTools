extends BaseMod


func init_mod() -> void:
	print("Init grayscale shader")
	
	# Add shader overlay to scene
	var scene: PackedScene = load("res://GrayscaleShaderMod/node/GrayscaleOverlay.tscn")
	var instance: CanvasLayer = scene.instantiate()
	ModLoader.add_child(instance)
