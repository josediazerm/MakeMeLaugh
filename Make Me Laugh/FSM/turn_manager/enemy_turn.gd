extends State

@export var turn_manager : Node2D

@export var timer : Timer

func Enter():
	turn_manager.Internal_Signal.connect(signal_detected)
	timer.start()

func Exit():
	turn_manager.Internal_Signal.disconnect(signal_detected)

func signal_detected(signal_data):
	if signal_data == Constants.END_LEVEL_SIGNAL:
		Transition.emit(self, Constants.END_LEVEL_SIGNAL)
	elif signal_data == Constants.KEEP_PLAYING_SIGNAL:
		Transition.emit(self, Constants.PLAYER_TURN_SIGNAL)
	elif signal_data == Constants.WAITING_SIGNAL:
		turn_manager.last_state = self.name
		Transition.emit(self, Constants.WAITING_SIGNAL)

func _on_timer_timeout():
	turn_manager.play_enemy_turn()
