extends Node2D


@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var animation_player: AnimationPlayer = %AnimationPlayer


# Stops, pacifies, and removes all bullets
func _stop_bullets() -> void:
	for node: Node in EnemySpawner.get_children():
		if node is not EnemyBullet:
			continue
		
		# Stop each bullet
		var bullet: EnemyBullet = node
		bullet.speed = 0.0
		bullet.damage = 0.0
		bullet.rotation_speed = 0.0
	
	for node: Node in EnemySpawner.get_children():
		if node is not EnemyBullet:
			continue
		
		# Remove each bullet one by one with a delay
		var bullet: EnemyBullet = node
		if bullet.speed < 1.0:
			bullet._start_dying()
			await Utilities.wait(0.1)


func _ready() -> void:
	_stop_bullets()
	
	# Load the node this way or Godot will throw an error
	sprite_2d.texture = Utilities.load_image_from_path("res://PassiveMod/boss_world_passive/stop_node/area.png")
	
	# Play the animation and then free this node
	sprite_2d.scale = Vector2.ZERO
	animation_player.play("expand")
	await animation_player.animation_finished
	queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is not Enemy:
		return
	
	# Stops movement and attacking for enemies in the radius of this effect
	var enemy: Enemy = body
	enemy.pause_movement(5.0)
	enemy.add_stun(5.0)
