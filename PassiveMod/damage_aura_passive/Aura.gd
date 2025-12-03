extends Sprite2D


func _ready() -> void:
    # Required since paths to textures don't resolve correctly when loaded as a mod
    texture = Utilities.load_image_from_path("res://PassiveMod/damage_aura_passive/sprite.png")
