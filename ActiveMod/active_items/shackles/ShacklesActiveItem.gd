extends BaseActiveItem


var _stun_time: float = 15.0


func setup(player: Player) -> void:
	_charge_time = 1.0
	
	super.setup(player)
	
	EventBus.boss_registered.connect(_on_boss_registered)


func _on_boss_registered(boss: Boss) -> void:
	boss.add_stun(_stun_time)


func update_uncharged_ui(_progress: float) -> void:
	update_charged_ui()


func can_activate() -> bool:
	return false
