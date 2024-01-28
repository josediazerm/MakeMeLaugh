extends Node2D

signal Internal_Signal
signal External_Signal

@export var data_manager : Node2D
@export var health_manager : Node2D
@export var enemy_manager : Node2D
@export var hand_zone : Panel

@export var bocadillo : Panel
@export var game : Node2D

@export var win_panel : Panel
@export var lose_panel : Panel

@export var music_manager : Node2D

var last_state = ""
var winner = ""

var signal_to_emit

func update_status(status):
	if status[Constants.PLAYER_NAME] <= 0:
		winner = Constants.ENEMY_NAME
		signal_to_emit = Constants.END_LEVEL_SIGNAL
	elif status[Constants.ENEMY_NAME] <= 0:
		winner = Constants.PLAYER_NAME
		signal_to_emit = Constants.END_LEVEL_SIGNAL
	else:
		winner = ""
		signal_to_emit = Constants.KEEP_PLAYING_SIGNAL
	Internal_Signal.emit(Constants.WAITING_SIGNAL)

func play_enemy_turn():
	enemy_manager.play_card()

func create_player_hand():
	hand_zone.create_hand()
	
func destroy_player_hand():
	hand_zone.destroy_hand()

func win():
	winner = ""
	destroy_player_hand()
	win_panel.position[1] = 0
	game.check_text()
	music_manager.play(Constants.WIN_EFFECT)
	var tmp_deck = data_manager.get_tmp_cards_played()
	for card in tmp_deck:
		data_manager.add_card_played_deck(card)
	data_manager.reset_card_played_tmp_deck()
	
func lose():
	winner = ""
	destroy_player_hand()
	lose_panel.position[1] = 0
	music_manager.play(Constants.LOSE_EFFECT)
	data_manager.reset_card_played_tmp_deck()
	
func its_player_turn():
	Internal_Signal.emit(Constants.PLAYER_TURN_SIGNAL)

func antibug_state():
	Internal_Signal.emit(Constants.ANTIBUG_SIGNAL)

func joke_ended():
	Internal_Signal.emit(signal_to_emit)

func enter_end_state():
	if winner == Constants.PLAYER_NAME:
		win()
	else:
		lose()
		
func hide_joke():
	bocadillo.hide_joke()
