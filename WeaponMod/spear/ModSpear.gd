extends Bullet


const MOD_NAME: String = "WeaponMod"


var down_mult: float = 0.75
var down_acc: float = 0.05
var should_orbit: bool = false
var is_left: bool = false
var elapsed_time: float = 0.0
var orbit_angle: float
var orbit_time: float


# Called when the node is recycled into the NodePool
# Used to reset any modified values
func reset() -> void:
	super.reset()
	
	down_mult = 0.75
	down_acc = 0.05
	should_orbit = false
	elapsed_time = 0.0
	scale = Vector2.ONE * 2.0
	is_left = false
	
	# Used to provide unique movement to this projectile in physics_process and process
	behaviour = Behaviour.CUSTOM
	speed = 250


func _process_normal_physics(delta: float) -> void:
	direction += Vector2.DOWN * down_mult * delta
	down_mult += down_acc * delta


func _process_orbit_physics(delta: float) -> void:
	var angle: float = delta * orbit_angle
	
	if is_left:
		angle *= -1
	
	direction = direction.rotated(angle)


# Called each frame
func physics_process(delta: float) -> void:
	if not should_orbit:
		_process_normal_physics(delta)
	else:
		_process_orbit_physics(delta)
	
	velocity = direction.normalized() * speed
	move_and_slide()


# Called each frame
func process(delta: float) -> void:
	# Make this bullet point in the direction that it wil move
	rotation = direction.angle() + facing_angle
	
	if not should_orbit:
		return
	
	# Timer for variant to make it die at some point
	elapsed_time += delta
	if elapsed_time >= orbit_time:
		# Recycle this projectile into the NodePool
		_release()


# Called when added to the scene
func ready() -> void:
	super.ready()
	
	orbit_time = ModLoader.config.get_setting_value(MOD_NAME, "orbit-time")
	orbit_angle = ModLoader.config.get_setting_value(MOD_NAME, "orbit-angle")


# Called when the projectile leaves the screen
func _on_VisibilityNotifier2D_screen_exited() -> void:
	# Orbiting projectiles can go off scren without dying
	if should_orbit:
		return
	
	# Recycle this projectile into the NodePool
	_release()
