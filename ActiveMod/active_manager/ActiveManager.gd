extends Node


var _active: bool = false


func _ready() -> void:
	prints("Create active manager")
	EventBus.game_started.connect(_on_game_started)
	EventBus.player_spawned.connect(_on_player_spawned)
	EventBus.player_died.connect(_on_player_died)


func _on_game_started() -> void:
	prints("Active")
	_active = true


func _on_player_spawned(player: Player) -> void:
	if not is_instance_valid(player.background):
		return
	
	prints("BG", player.background)


func _on_player_died() -> void:
	var num_players: int = 0
	var num_dead_players: int = 0
	
	for player: Player in Utilities.get_all_players():
		num_players += 1
		
		if player.is_dead():
			num_dead_players += 1
	
	if num_dead_players == num_players:
		_active = false
		prints("Inactive")


func _process(_delta: float) -> void:
	if not _active:
		return
