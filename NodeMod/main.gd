extends BaseMod


func init_mod() -> void:
	print("Init node mod")
	
	var num_nodes: int = 15
	var scene: PackedScene = load("res://NodeMod/node/Node.tscn")
	for j: int in 3:
		for i: int in num_nodes:
			var instance: CanvasLayer = scene.instantiate()
			
			# Do initial setup for this node
			@warning_ignore("unsafe_method_access")
			instance.setup(num_nodes, i, j)
			
			# Add to tree
			ModLoader.add_child(instance)
	
	print("Added nodes from node mod")
