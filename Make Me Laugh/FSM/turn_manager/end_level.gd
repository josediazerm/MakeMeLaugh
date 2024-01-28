extends State

@export var turn_manager : Node2D


func Enter():
	turn_manager.Internal_Signal.connect(signal_detected)
	turn_manager.enter_end_state()


func Exit():
	turn_manager.Internal_Signal.disconnect(signal_detected)

func signal_detected(signal_data):
	if signal_data == Constants.ANTIBUG_SIGNAL:
		Transition.emit(self, Constants.ANTIBUG_SIGNAL)

