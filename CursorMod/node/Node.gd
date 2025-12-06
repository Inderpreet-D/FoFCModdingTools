extends Node


# Basically the same as a normal timer but will be paused when the
# game becomes paused and also works with small timeouts
@onready var pausable_timer: PausableTimer = %PausableTimer


# Blinks the cursor on and off
func _play_animation() -> void:
	if not InputManager.is_on_menu():
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
		return
	
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	await Utilities.wait(0.1)
	
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	await Utilities.wait(0.1)
	
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	await Utilities.wait(0.1)


func _on_pausable_timer_timeout() -> void:
	# Stop the timer to allow an animation to play
	pausable_timer.stop()
	
	await _play_animation()
	
	# Restart timer with random timeout
	pausable_timer.delay = randf_range(1.0, 3.0)
	pausable_timer.start()


func _ready() -> void:
	print("Added cursor mod node")
