extends Node


@onready var pausable_timer: PausableTimer = %PausableTimer


func _on_pausable_timer_timeout() -> void:
    pausable_timer.stop()
    
    if InputManager.is_on_menu():
        Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
        await Utilities.wait(0.1)
        
        Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
        await Utilities.wait(0.1)
        
        Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
        await Utilities.wait(0.1)
    else:
        Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
    
    pausable_timer.delay = randf_range(1.0, 3.0)
    pausable_timer.start()


func _ready() -> void:
    print("Added cursor mod node")
