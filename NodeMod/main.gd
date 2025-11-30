extends BaseMod


func init_mod() -> void:
    print("Init node mod now")
    
    var num_nodes: int = 15
    var scene: PackedScene = load("res://NodeMod/node/Node.tscn")
    for j: int in 3:
        for i: int in num_nodes:
            var instance: CanvasLayer = scene.instantiate()
            @warning_ignore("unsafe_method_access")
            instance.setup(num_nodes, i, j)
            ModLoader.add_child(instance)
