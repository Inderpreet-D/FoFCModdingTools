extends "res://ActiveMod/base_active_item/BaseActiveItem.gd"


func _ready() -> void:
	sprite_2d.texture = Utilities.load_image_from_path("res://ActiveMod/active_items/black_hole/hole.png")
	super._ready()


func setup(player: Player) -> void:
	_charge_time = 30.0
	
	super.setup(player)


func activate() -> void:
	super.activate()
	
	var black_hole_instance: BlackHole = NodePool.create_node("BlackHole")
	black_hole_instance.life_time = 8.0
	black_hole_instance.scale *= 20.0
	black_hole_instance.suck_speed = 200.0
	black_hole_instance.suck_acceleration = 15.0
	black_hole_instance.global_position = _player.global_position
	get_tree().get_first_node_in_group("bullets").add_child.call_deferred(black_hole_instance)
