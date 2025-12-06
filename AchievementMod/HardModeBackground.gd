class_name HardModeBackground extends Background


# Used to modify what the effect of a specific shop upgrade is
func modify_upgrade_data(key: String, data: Variant) -> Variant:
	# Makes it so that this background can only have one follower
	if key == "num-weapons":
		return 1
	
	# All other upgrades have their normal effect
	return super.modify_upgrade_data(key, data)
