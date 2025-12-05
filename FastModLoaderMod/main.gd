extends BaseMod


func init_mod() -> void:
    print("Init fast mod loader mod")
    
    var node: ModLoaderUI = ModLoader.get_tree().root.get_node("/root/ModLoaderUI")
    node.wait_delay = 0.0
    node.end_delay = 0.0
    
    print("Fast mod loader done")
