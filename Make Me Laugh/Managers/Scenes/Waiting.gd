extends State

@export var turn_manager : Node2D
@export var timer : Timer

var can_change_joke = false

func Enter():
	can_change_joke = false
	timer.start()

func Exit():
	can_change_joke = false


func Update(_delta):
	if Input.is_action_just_pressed("Click"):
		change_scene()

func change_scene():
	if turn_manager.winner == "":
		Transition.emit(self, Constants.NEXT_STATE[turn_manager.last_state])
		turn_manager.hide_joke()
	else:
		Transition.emit(self, Constants.END_LEVEL_SIGNAL)
		turn_manager.hide_joke()


func _on_timer_timeout():
	can_change_joke = false
