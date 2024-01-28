extends State

@export var turn_manager : Node2D
@export var timer : Timer


func Enter():
	timer.start()

func _on_timer_timeout():
	Transition.emit(self, Constants.PLAYER_TURN_SIGNAL)
