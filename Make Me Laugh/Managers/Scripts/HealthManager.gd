extends Node2D

@export var data_manager : Node2D

var player_health
var enemy_health

var player_stats
var enemy_stats

var damage_to_deal

func _ready():
	player_health = Constants.INITIAL_HEALTH
	enemy_health = Constants.INITIAL_HEALTH
	player_stats = data_manager.get_player_stats()
	enemy_stats = data_manager.get_enemy_stats()

func apply_damage(damage_dealer : String, humor_type : String):
	if damage_dealer == Constants.PLAYER_NAME:
		apply_damage_to_enemy(humor_type)
	else:
		apply_damage_to_player(humor_type)

func apply_damage_to_player(humor_type : String):
	damage_to_deal = Constants.REACTIONS_DAMAGES[player_stats[humor_type]]
	player_health -= damage_to_deal

func apply_damage_to_enemy(humor_type : String):
	damage_to_deal = Constants.REACTIONS_DAMAGES[enemy_stats[humor_type]]
	enemy_health -= damage_to_deal
	print(enemy_health)

func check_status():
	var status = {
		Constants.PLAYER_NAME : player_health,
		Constants.ENEMY_NAME : enemy_health
	}
	return status
