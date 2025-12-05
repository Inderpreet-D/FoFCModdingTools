class_name HardModeBackground extends Background


func modify_upgrade_data(key: String, data: Variant) -> Variant:
    if key == "num-weapons":
        return 1

    return super.modify_upgrade_data(key, data)
