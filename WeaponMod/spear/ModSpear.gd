extends Bullet


const ORBIT_ANGLE: float = PI * 0.5


var down_mult: float = 0.75
var down_acc: float = 0.05
var should_orbit: bool = false
var is_left: bool = false
var elapsed_time: float = 0.0


func reset() -> void:
    super.reset()

    down_mult = 0.75
    down_acc = 0.05
    should_orbit = false
    elapsed_time = 0.0
    scale = Vector2.ONE * 2.0
    is_left = false
    
    behaviour = Behaviour.CUSTOM
    speed = 250


func physics_process(delta: float) -> void:
    if not should_orbit:
        direction += Vector2.DOWN * down_mult * delta
        down_mult += down_acc * delta
    else:
        if is_left:
            direction = direction.rotated(ORBIT_ANGLE * delta)
        else:
            direction = direction.rotated(-ORBIT_ANGLE * delta)

    velocity = direction.normalized() * speed
    move_and_slide()


func process(delta: float) -> void:
    rotation = direction.angle() + facing_angle
    
    if not should_orbit:
        return
    
    elapsed_time += delta
    if elapsed_time > 20.0:
        _release()


func _on_VisibilityNotifier2D_screen_exited() -> void:
    if should_orbit:
        return
    
    _release()
