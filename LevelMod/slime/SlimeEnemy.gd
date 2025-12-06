extends CreepEnemy


var num_splits_remaining: int = 2


func reset() -> void:
    super.reset()
    
    num_splits_remaining = 2
    
    shadow.position = Vector2(0.0, 18.667)
    shadow.scale = Vector2(6.35, 3.0)
    sprite.scale = Vector2.ONE
    scale = Vector2.ONE * 2.0


func _spawn_smaller_slime(character_position: Vector2, offset: Vector2) -> void:
    var left_slime: CreepEnemy = NodePool.create_node("Slime")
    left_slime.global_position = character_position + offset
    @warning_ignore("unsafe_property_access")
    left_slime.num_splits_remaining = num_splits_remaining - 1
    left_slime.scale = scale * 0.5
    left_slime.death_gain = 0.0
    EnemySpawner.add_enemy(left_slime)


func _on_dead(character: Character) -> void:
    if num_splits_remaining == 0:
        return
    
    var offset: float = sprite.scale.x * 32
    
    _spawn_smaller_slime(character.global_position, Vector2.LEFT * offset)
    _spawn_smaller_slime(character.global_position, Vector2.RIGHT * offset)


func ready() -> void:
    super.ready()
    
    dead.connect(_on_dead)
    
    if sprite.sprite_frames.get_frame_count("walk") == 0:
        sprite.sprite_frames.add_frame("walk", Utilities.load_image_from_path("res://LevelMod/slime/slime.png"))
