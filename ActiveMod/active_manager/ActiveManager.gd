class_name ActiveManager extends Node


static var item_info: Dictionary = {}
var _active: bool = false
var _items: Array[BaseActiveItem] = []


func _ready() -> void:
	EventBus.game_started.connect(_on_game_started)
	EventBus.player_died.connect(_on_player_died)


func _get_scene(background: Background) -> PackedScene:
	var script: Variant = background.get_script()
	if not script:
		return null
	
	var as_script: Script = script
	var background_key: String = as_script.get_global_name()
	
	if not item_info.has(background_key):
		print("[ActiveMod] no item for background \"%s\"" % background_key)
		return null
	
	var info: Dictionary = item_info.get(background_key)
	var scene_path: String = info.get("scene")
	return load(scene_path)


func _get_item_instance(background: Background) -> BaseActiveItem:
	var scene: PackedScene = _get_scene(background)
	
	if not scene:
		return null
	
	return scene.instantiate()


func _on_game_started() -> void:
	_active = true
	
	for item: BaseActiveItem in _items:
		if is_instance_valid(item):
			item.clean_up()
	
	_items = []
	
	for player: Player in Utilities.get_all_players():
		var item: BaseActiveItem = _get_item_instance(player.background)
		if not item:
			continue
		
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


# Can be used by other mods to add / overwrite items for specific backgrounds
static func add_item(background_key: String, info: Dictionary) -> void:
	if background_key.length() == 0:
		print("[ActiveMod] unable to add item with invalid background key")
		return
	
	if not info.has("name"):
		print("[ActiveMod] unable to add item for background \"%s\", name is missing" % background_key)
		return
	
	if not info.has("description"):
		print("[ActiveMod] unable to add item for background \"%s\", description is missing" % background_key)
		return
	
	if not info.has("scene"):
		print("[ActiveMod] unable to add item for background \"%s\", scene is missing" % background_key)
		return
	
	if item_info.has(background_key):
		print("[ActiveMod] overwriting item for background \"%s\"" % background_key)
		return
	
	item_info.set(background_key, info)


static func load_items_from_json() -> void:
	var dict: Dictionary = Utilities.read_json_dict("res://ActiveMod/actives.json")
	
	for background_key: String in dict.keys():
		var info_dict: Dictionary = dict.get(background_key)
		add_item(background_key, info_dict)


static func modify_background_descriptions() -> void:
	for key: String in DefHandler.backgrounds:
		if not item_info.has(key):
			continue
		
		var info: Dictionary = item_info.get(key)
		var item_name: String = info.get("name")
		var item_description: String = info.get("description")
		var def: BackgroundDef = DefHandler.backgrounds[key]
		var desc_lines: Array = [
			"+Starts with %s" % Keywords._create_hint(item_name, item_description, "hot pink")
		]
		def._description += "\n%s" % def.build_description(desc_lines)
