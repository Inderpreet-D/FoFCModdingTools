extends Node


# TODO Add a static dictionary and func to add overrides / extensions

var _active: bool = false
var _items: Array[BaseActiveItem] = []


func _ready() -> void:
	EventBus.game_started.connect(_on_game_started)
	EventBus.player_died.connect(_on_player_died)


func _get_item_instance(background: Background) -> BaseActiveItem:
	var scene: PackedScene = load("res://ActiveMod/base_active_item/BaseActiveItem.tscn")
	
	# TODO Get from static dictionary
	if background is DefaultBackground:
		scene = load("res://ActiveMod/active_items/healing/HealingActiveItem.tscn")
	
	return scene.instantiate()


func _on_game_started() -> void:
	_active = true
	
	for item: BaseActiveItem in _items:
		if is_instance_valid(item):
			item.clean_up()
	
	_items = []
	
	for player: Player in Utilities.get_all_players():
		var item: BaseActiveItem = _get_item_instance(player.background)
		item.setup(player)
		_items.append(item)
		player.add_child(item)


func _on_player_died() -> void:
	var num_players: int = 0
	var num_dead_players: int = 0
	
	for player: Player in Utilities.get_all_players():
		num_players += 1
		
		if player.is_dead():
			num_dead_players += 1
	
	if num_dead_players == num_players:
		_active = false


func _process(_delta: float) -> void:
	if not _active:
		return
	
	if not Input.is_action_just_pressed("use_active_item"):
		return
	
	for item: BaseActiveItem in _items:
		if not item.can_activate():
			continue
		
		if not is_instance_valid(item._player):
			continue
		
		item.activate()
