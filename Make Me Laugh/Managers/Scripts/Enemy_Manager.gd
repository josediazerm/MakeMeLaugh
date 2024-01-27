extends Node2D

@export var data_manager : Node2D 
@export var health_manager : Node2D 

@export var deck_generator : Node2D
@export var stats_generator : Node2D
@export var bocadillo : Panel

@export var sprite : Sprite2D

var enemy_deck = []
var cards_played = []
var possible_cards = []
var card_to_play


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
	bocadillo.show_joke(card_instance.get_chiste_text(), card_instance.get_chiste_sprite())
	health_manager.apply_damage(Constants.ENEMY_NAME, card_instance.get_chiste_type())

func reset_hand():
	cards_played = []
	possible_cards = []
	card_to_play = null

func generate_deck():
	enemy_deck = deck_generator.generate_opponent_deck()

func generate_stats():
	data_manager.save_enemy_stats(stats_generator.create_enemy_reactions())

func place_sprite():
	sprite.texture = load(Constants.ICONS[Global.opponent_number])
	sprite.visible = true
