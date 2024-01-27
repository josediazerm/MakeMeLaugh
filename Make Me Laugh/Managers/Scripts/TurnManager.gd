extends Node2D

signal Internal_Signal
signal External_Signal

@export var data_manager : Node2D
@export var health_manager : Node2D

var last_state = ""
var winner = ""


func player_card_played():
	Internal_Signal.emit(Constants.END_PLAYER_TURN_SIGNAL)
