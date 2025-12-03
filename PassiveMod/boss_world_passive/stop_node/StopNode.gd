extends Node2D


@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var animation_player: AnimationPlayer = %AnimationPlayer


func _ready() -> void:
    sprite_2d.texture = Utilities.load_image_from_path("res://PassiveMod/boss_world_passive/stop_node/area.png")
    sprite_2d.scale = Vector2.ZERO
    animation_player.play("expand")
    await animation_player.animation_finished
    queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
    if body is not Enemy:
        return
    
    var enemy: Enemy = body
    enemy.pause_movement(5.0)
    enemy.add_stun(5.0)
