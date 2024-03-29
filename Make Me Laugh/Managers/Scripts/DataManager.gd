extends Node2D

var _save_data : SaveSystem

func _init():
	_create_or_load_save_data()

# Loads the last save_data file or creates it if there isn't any
func _create_or_load_save_data() -> void:
	if SaveSystem.save_exists():
		_save_data = SaveSystem.load_savedata()
	else:
		_save_data = SaveSystem.new()
		_save_data.write_savedata()

func _save_game() -> void:
	_save_data.write_savedata()

func save_player_deck(deck : Array) -> void:
	_save_data.player_deck = deck
	_save_data.write_savedata()
	
func get_player_deck() -> Array:
	return _save_data.player_deck

func save_player_stats(stats : Dictionary) -> void:
	_save_data.player_stats = stats
	_save_data.write_savedata()

func get_player_stats() -> Dictionary:
	return _save_data.player_stats

func save_enemy_stats(stats : Dictionary) -> void:
	_save_data.enemy_stats = stats
	_save_data.write_savedata()

func get_enemy_stats() -> Dictionary:
	return _save_data.enemy_stats

func save_enemy_deck(deck : Array) -> void:
	_save_data.enemy_deck = deck
	_save_data.write_savedata()

func get_enemy_deck() -> Array:
	return _save_data.enemy_deck

func reset_card_played_tmp_deck() -> void:
	_save_data.tmp_cards_played = []
	_save_data.write_savedata()

func reset_card_played_deck() -> void:
	_save_data.cards_played = []
	_save_data.write_savedata()


func add_card_played_tmp_deck(card : String) -> void:
	_save_data.tmp_cards_played.append(card)
	_save_data.write_savedata()

func get_cards_played() -> Array:
	return _save_data.cards_played

func get_tmp_cards_played() -> Array:
	return _save_data.tmp_cards_played

func add_card_played_deck(card : String) -> void:
	_save_data.cards_played.append(card)
	_save_data.write_savedata()
