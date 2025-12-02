extends Node2D


@onready var shape_cast_2d: ShapeCast2D = %ShapeCast2D


func _on_pausable_timer_timeout() -> void:
    shape_cast_2d.force_shapecast_update()
    for i: int in shape_cast_2d.get_collision_count():
        var body: CharacterBody2D = shape_cast_2d.get_collider(i)

        if not (body is Enemy or body is Player):
            continue
        
        if body is Enemy:
            var atk: Attack = Attack.new(5.0)
            atk.add_effect(PoisonDebuff.new(0.2))
            var enemy: Enemy = body
            enemy.take_damage(atk)
        else:
            var atk: Attack = Attack.new(2.0)
            var player: Player = body
            player.take_damage(atk)
