extends Node2D

@export var data_manager : Node2D

@export var label : Label

var cards_played 


func _ready():
	cards_played = data_manager.get_cards_played()
	find_most_played_card()
	

func find_most_played_card():
	var deck_freq = {}
	
	for card in cards_played:
		if card not in deck_freq.keys():
			deck_freq[card] = 1
		else:
			deck_freq[card] += 1

	var most_played_card_value = 0
	var most_played_card_key = ""

	for key in deck_freq.keys():
		if deck_freq[key] > most_played_card_value:
			most_played_card_key = key
			most_played_card_value = deck_freq[key]
			
	label.text = most_played_card_key
	
	
	var str = most_played_card_key.split("_")

	var rec_str = "%s/%s/%s_%s%s"
	rec_str = rec_str % [Constants.DEFAULT_CHISTES, str[1], str[2], str[3], Constants.SCENE_SUFFIX]
	
	var card_load = load(rec_str)
	var card_instance =  card_load.instantiate()
	card_instance.position = Vector2 (0, 0)
	card_instance.target_position = Vector2 (0, 0)
	call_deferred("add_child", card_instance)
