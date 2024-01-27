extends State

@export var turn_manager : Node2D

func Enter():
	turn_manager.Internal_Signal.connect(signal_detected)
	#turn_manager.create_player_hand()

func Exit():
	turn_manager.Internal_Signal.disconnect(signal_detected)
	#turn_manager.destroy_player_hand()
	turn_manager.last_state = self.name

func signal_detected(signal_data):
	if signal_data == Constants.END_LEVEL_SIGNAL:
		Transition.emit(self, Constants.END_LEVEL_SIGNAL)
	elif signal_data == Constants.KEEP_PLAYING_SIGNAL:
		Transition.emit(self, Constants.ENEMY_TURN_SIGNAL)
