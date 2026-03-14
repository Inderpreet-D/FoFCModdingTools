extends "res://ActiveMod/base_active_item/BaseActiveItem.gd"


var _proc_chance: float = 0.25
var _duration: float = 5.0


func _ready() -> void:
	sprite_2d.texture = Utilities.load_image_from_path("res://ActiveMod/active_items/dog_whistle/dog_whistle.png")
	super._ready()


func setup(player: Player) -> void:
	_charge_time = 10.0
	_auto_activate = true
	_start_charged = false
	
	super.setup(player)


func activate() -> void:
	super.activate()
	
	for enemy: Enemy in Utilities.get_all_enemies():
		if randf() > _proc_chance:
			continue
		
		enemy.add_stun(_duration)
