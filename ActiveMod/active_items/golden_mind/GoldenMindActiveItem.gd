extends "res://ActiveMod/base_active_item/BaseActiveItem.gd"


var _duration: float = 20.0
var _active: bool = false


func _ready() -> void:
	sprite_2d.texture = Utilities.load_image_from_path("res://ActiveMod/active_items/golden_mind/golden_mind.png")
	super._ready()


func setup(player: Player) -> void:
	_charge_time = 45.0
	
	super.setup(player)
	
	EnemySpawner.enemy_dead.connect(_on_enemy_dead)


func _on_enemy_dead(enemy: Enemy) -> void:
	if not _active:
		return
	
	var coin_pickup: CoinPickup = NodePool.create_node("coin")
	coin_pickup.global_position = enemy.global_position
	PickupHandler.add_child(coin_pickup)


func activate() -> void:
	super.activate()
	
	_active = true
	
	await Utilities.wait(_duration)
	
	_active = false
