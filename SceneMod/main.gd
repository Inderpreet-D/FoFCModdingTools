extends BaseMod


func init_mod() -> void:
	SceneCache._scenes.set("BOSS_HEALTH", load("res://SceneMod/boss_bar/BossBar.tscn"))
