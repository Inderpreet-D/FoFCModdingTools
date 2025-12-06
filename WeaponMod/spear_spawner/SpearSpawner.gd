extends Weapon


var should_orbit: bool = false


func on_variant_selected() -> void:
    super.on_variant_selected()

    match variant:
        0:
            tags.swap_tag(WeaponTags.WeaponTag.SingleShot, WeaponTags.WeaponTag.FullAuto)
        1:
            should_orbit = true


func create_bullet() -> void:
    var spear: Bullet = NodePool.create_node("ModSpear")
    spear.damage = damage
    spear.global_position = global_position
    
    @warning_ignore("unsafe_property_access")
    spear.should_orbit = should_orbit

    if scale.x > 0:
        spear.direction = Vector2.RIGHT.rotated(-PI / 4)
        @warning_ignore("unsafe_property_access")
        spear.is_left = false
    else:
        spear.direction = Vector2.LEFT.rotated(PI / 4)
        @warning_ignore("unsafe_property_access")
        spear.is_left = true
    
    add_bullet(spear)


func attack() -> void:
    super.attack()

    for i: int in shot_count:
        create_bullet()
        await Utilities.wait(0.33)
