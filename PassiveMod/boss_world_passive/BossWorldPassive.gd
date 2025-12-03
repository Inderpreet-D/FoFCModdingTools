class_name BossWorldPassive extends BossPassive


const EFFECT_TIMEOUT: float = 30.0


var _elapsed_time: float = 0.0


func _init() -> void :
    super._init()
    effect_name = "BossWorldPassive"


func process(delta: float) -> bool:
    var result: bool = super.process(delta)
    
    _elapsed_time += delta
    if _elapsed_time < EFFECT_TIMEOUT:
        return result
    
    _elapsed_time = 0.0
    
    var stop_scene: PackedScene = load("res://PassiveMod/boss_world_passive/stop_node/StopNode.tscn")
    var stop_node: Node2D = stop_scene.instantiate()
    stop_node.global_position = _player.global_position
    #var bullet_holder: Node = _player.get_tree().get_first_node_in_group("bullets")
    #bullet_holder.add_child(stop_node)
    #bullet_holder.move_child(stop_node, 0)
    EnemySpawner.add_enemy(stop_node, true)
    #bullet_holder.call_deferred("add_child", stop_node)
    
    return result
