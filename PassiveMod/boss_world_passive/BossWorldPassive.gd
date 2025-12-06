class_name BossWorldPassive extends BossPassive


const EFFECT_TIMEOUT: float = 30.0


var _elapsed_time: float = 0.0


# Called when this class is instantiated
func _init() -> void:
	super._init()
	
	# This needs to match the class name
	effect_name = "BossWorldPassive"


# Create an instance of the stop node and add it to the tree
func _create_stop_node() -> void:
	var stop_scene: PackedScene = load("res://PassiveMod/boss_world_passive/stop_node/StopNode.tscn")
	var stop_node: Node2D = stop_scene.instantiate()
	stop_node.global_position = _player.global_position
	EnemySpawner.add_misc(stop_node, true)


# Called every frame
func process(delta: float) -> bool:
	var result: bool = super.process(delta)
	
	_elapsed_time += delta
	if _elapsed_time < EFFECT_TIMEOUT:
		return result
	
	_elapsed_time = 0.0
	
	# Create the node on an interval
	_create_stop_node()
	
	return result
