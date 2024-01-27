extends Node2D

signal Internal_Signal
signal External_Signal

@export var data_manager : Node2D
@export var health_manager : Node2D
@export var enemy_manager : Node2D
@export var hand_zone : Panel

var last_state = ""
var winner = ""

func update_status(status):

	if status[Constants.PLAYER_NAME] == 0:
		winner = Constants.PLAYER_NAME
		Internal_Signal.emit(Constants.END_LEVEL_SIGNAL)
	elif status[Constants.ENEMY_NAME] == 0:
		winner = Constants.ENEMY_NAME
		Internal_Signal.emit(Constants.END_LEVEL_SIGNAL)
	else:
		Internal_Signal.emit(Constants.KEEP_PLAYING_SIGNAL)

func play_enemy_turn():
	enemy_manager.play_card()

func create_player_hand():
	hand_zone.create_hand()
	
func destroy_player_hand():
	hand_zone.destroy_hand()
