extends Weapon


var should_orbit: bool = false


# Called when the player picks an ascension option
func on_variant_selected() -> void:
	super.on_variant_selected()
	
	match variant:
		0:
			# First variant makes you throw 5 spears instead of 1
			tags.swap_tag(WeaponTags.WeaponTag.SingleShot, WeaponTags.WeaponTag.FullAuto)
		1:
			# Second variant enables orbit behaviour
			should_orbit = true


# Called to instance the bullet that this weapon should use
func create_bullet() -> void:
	# Create a custom spear projectile
	var spear: Bullet = NodePool.create_node("ModSpear")
	spear.damage = damage
	spear.global_position = global_position
	
	# This property exists but we cannot use a mod class name so we lose type checking
	@warning_ignore("unsafe_property_access")
	spear.should_orbit = should_orbit
	
	if scale.x > 0:
		spear.direction = Vector2.RIGHT.rotated(-PI / 4)
		# This property exists but we cannot use a mod class name so we lose type checking
		@warning_ignore("unsafe_property_access")
		spear.is_left = false
	else:
		spear.direction = Vector2.LEFT.rotated(PI / 4)
		# This property exists but we cannot use a mod class name so we lose type checking
		@warning_ignore("unsafe_property_access")
		spear.is_left = true
	
	# Allow weapon to modify and then add the bullet to the scene
	add_bullet(spear)


# Called whenever an attack should happen
func attack() -> void:
	super.attack()
	
	for i: int in shot_count:
		create_bullet()
		await Utilities.wait(0.33)
