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


