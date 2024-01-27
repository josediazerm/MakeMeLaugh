extends Node2D

signal Internal_Signal
signal External_Signal

@export var data_manager : Node2D
@export var health_manager : Node2D
@export var enemy_manager : Node2D
@export var hand_zone : Panel

@export var win_panel : Panel
@export var lose_panel : Panel

var last_state = ""
var winner = ""

func update_status(status):

	if status[Constants.PLAYER_NAME] <= 0:
		winner = Constants.PLAYER_NAME
		Internal_Signal.emit(Constants.END_LEVEL_SIGNAL)
		lose()
	elif status[Constants.ENEMY_NAME] <= 0:
		winner = Constants.ENEMY_NAME
		Internal_Signal.emit(Constants.END_LEVEL_SIGNAL)
		win()
	else:
		Internal_Signal.emit(Constants.KEEP_PLAYING_SIGNAL)

func play_enemy_turn():
	enemy_manager.play_card()

func create_player_hand():
	hand_zone.create_hand()
	
func destroy_player_hand():
	hand_zone.destroy_hand()

func win():
	destroy_player_hand()
	win_panel.position[1] = 0
	
func lose():
	destroy_player_hand()
	lose_panel.position[1] = 0
	
func its_player_turn():
	Internal_Signal.emit(Constants.PLAYER_TURN_SIGNAL)
