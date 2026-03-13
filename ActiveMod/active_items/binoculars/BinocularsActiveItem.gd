extends "res://ActiveMod/base_active_item/BaseActiveItem.gd"


var _enemy_mark_chance: float = 0.25


func _ready() -> void:
	sprite_2d.texture = Utilities.load_image_from_path("res://ActiveMod/active_items/binoculars/binoculars.png")
	super._ready()


func setup(player: Player) -> void:
	_charge_time = 30.0
	_auto_activate = true
	
	super.setup(player)


func _can_proc(node: Node) -> bool:
	if node is Boss:
		return true
	
	if node is not Enemy:
		return false
	
	return randf() >= _enemy_mark_chance


func activate() -> void:
	super.activate()
	
	for enemy_node: Node in Utilities.get_all_enemies():
		if not _can_proc(enemy_node):
			continue
		
		var enemy: Enemy = enemy_node
		var atk: Attack = Attack.new()
		atk.add_effect(MarkedDebuff.new())
		enemy.take_damage(atk)
