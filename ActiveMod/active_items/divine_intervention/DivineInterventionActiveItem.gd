extends "res://ActiveMod/base_active_item/BaseActiveItem.gd"


var _duration: float = 10.0


func _ready() -> void:
	sprite_2d.texture = Utilities.load_image_from_path("res://ActiveMod/active_items/divine_intervention/divine_intervention.png")
	super._ready()


func setup(player: Player) -> void:
	_charge_time = 60.0
	
	super.setup(player)


func activate() -> void:
	super.activate()
	
	_player.make_invincible(_duration)
