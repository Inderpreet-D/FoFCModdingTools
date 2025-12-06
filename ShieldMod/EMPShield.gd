class_name EMPShield extends Shield


func _init() -> void :
    type = "EMPShield"

    super._init(ShieldStat._2)


func on_break() -> void :
    super.on_break()
    
    # Async func that will be called and done after the shield is un-equipped
    # await will not work in on_break function for shields (by design)
    var break_func: Callable = func() -> void:
        for node: Node in EnemySpawner.get_children():
            if node is not EnemyBullet:
                continue
            
            var bullet: EnemyBullet = node
            bullet.speed = 0.0
            bullet.damage = 0.0
            bullet.rotation_speed = 10.0

        for node: Node in EnemySpawner.get_children():
            if node is not EnemyBullet:
                continue
            
            var bullet: EnemyBullet = node
            if bullet.speed < 1.0:
                bullet._start_dying()
                await Utilities.wait(0.1)
    
    break_func.call()
