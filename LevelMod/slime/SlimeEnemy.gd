extends CreepEnemy


var num_splits_remaining: int = 2


# Called when this object is re-added to the NodePool
# Used to reset any values that are different from the default or will be changed
func reset() -> void:
	super.reset()
	
	num_splits_remaining = 2
	
	shadow.position = Vector2(0.0, 18.667)
	shadow.scale = Vector2(6.35, 3.0)
	sprite.scale = Vector2.ONE
	scale = Vector2.ONE * 2.0


# Makes a copy of this node
func _spawn_smaller_slime(character_position: Vector2, offset: Vector2) -> void:
	# Use NodePool to create an instance
	var slime: CreepEnemy = NodePool.create_node("Slime")
	slime.global_position = character_position + offset
	
	# Make smaller slimes split one time less
	@warning_ignore("unsafe_property_access")
	slime.num_splits_remaining = num_splits_remaining - 1
	slime.scale = scale * 0.5
	
	# Prevents the small slime from increasing the spawn capacity when it dies
	slime.death_gain = 0.0
	
	# Add the enemy to the tree
	EnemySpawner.add_enemy(slime)


# Called when this enemy dies
func _on_dead(character: Character) -> void:
	if num_splits_remaining == 0:
		return
	
	# Make smaller slimes to the left and right of this one
	var offset: float = sprite.scale.x * 32
	_spawn_smaller_slime(character.global_position, Vector2.LEFT * offset)
	_spawn_smaller_slime(character.global_position, Vector2.RIGHT * offset)


# Called when the enemy is added to the tree
func ready() -> void:
	super.ready()
	
	dead.connect(_on_dead)
	
	# Adds the image of the slime to it's sprite, needs to be done this way
	# Godot will throw an error if you load an image in a different way, like through the scene tree
	if sprite.sprite_frames.get_frame_count("walk") == 0:
		sprite.sprite_frames.add_frame("walk", Utilities.load_image_from_path("res://LevelMod/slime/slime.png"))
