extends Node2D

@export var data_manager : Node2D 
@export var health_manager : Node2D 

var enemy_deck = []

var cards_played = []
var possible_cards = []
var card_to_play

func _ready():
	enemy_deck = data_manager.get_enemy_deck()
	
	
func get_card_to_play():
	if cards_played.size() <= 3:
		cards_played = []
	
	for card in enemy_deck:
		if card not in cards_played:
			possible_cards.append(card)
	
	card_to_play = possible_cards[randi() % possible_cards.size()]
	cards_played.append(card_to_play)

func play_card():
	get_card_to_play()
	var card_load = load(card_to_play)	
	var card_instance =  card_load.instantiate() 
	health_manager.apply_damage(Constants.ENEMY_NAME, card_instance.get_chiste_type())


