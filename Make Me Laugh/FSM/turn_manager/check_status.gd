extends State

@export var turn_manager : Node2D

@export var timer : Timer

func Enter():
	turn_manager.Internal_Signal.connect(signal_detected)
	turn_manager.check_status()
	timer.start()
	

func Exit():
	turn_manager.Internal_Signal.disconnect(signal_detected)


func signal_detected(signal_data):
	if signal_data == Constants.KEEP_PLAYING_SIGNAL:
		print(Constants.NEXT_STATE[turn_manager.last_state])
		Transition.emit(self, Constants.NEXT_STATE[turn_manager.last_state])
	elif signal_data == Constants.END_LEVEL_SIGNAL:
		Transition.emit(self, Constants.END_LEVEL_SIGNAL)


func _on_timer_timeout():
	pass # Replace with function body.
