extends Node2D

@export var player_hand : Panel
@export var enemy_manager : Node2D
@export var win_panel : Panel
@export var lose_panel : Panel
@export var health_manager : Node2D
@export var turn_manager : Node2D
@export var music_manager : Node2D

func reset_hands():
	player_hand.reset_hand()
	enemy_manager.reset_hand()

func reset_panels():
	win_panel.position[1] = Constants.WIN_PANEL_DEFAULT_POSITION
	lose_panel.position[1] = Constants.LOSE_PANEL_DEFAULT_POSITION

func reset_hp_bars():
	health_manager.reset_hp_bars()

func give_turn_to_player():
	turn_manager.its_player_turn()

func generate_opponent():
	enemy_manager.generate_deck()
	enemy_manager.generate_stats()
	enemy_manager.place_sprite()

func _ready():
	reset_panels()
	reset_hands()
	generate_opponent()
	Global.opponent_number = 0
	music_manager.play(Constants.LUCHA_MUSIC)

func _on_next_pressed():
	Global.opponent_number += 1

	if Global.opponent_number < Constants.MAX_OPPONENTES:
		reset_panels()
		reset_hands()
		generate_opponent()
		reset_hp_bars()
		give_turn_to_player()
	else:
		get_tree().change_scene_to_file(Constants.WIN_SCENE)

func _on_menu_pressed():
	get_tree().change_scene_to_file(Constants.MAIN_MENU_SCENE)

func _on_retry_pressed():
	reset_panels()
	reset_hands()
	reset_hp_bars()
	give_turn_to_player()

