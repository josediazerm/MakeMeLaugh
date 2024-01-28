extends Node2D

@export var data_manager : Node2D

@export var music_manager : Node2D

var cards_played 


func _ready():
	cards_played = data_manager.get_cards_played()
	print(cards_played)
	find_most_played_card()

	music_manager.play(Constants.MENU_SOLO_INICIO_MUSIC )


func _on_music_finished():

	music_manager.play(Constants.MENU_SIN_INICIO_MUSIC )


func find_most_played_card():
	var deck_freq = {}
	
	for card in cards_played:
		if card not in deck_freq.keys():
			deck_freq[card] = 1
		else:
			deck_freq[card] += 1

	var most_played_card_value = 0
	var most_played_card_key = ""
	
	print(deck_freq)
	print(most_played_card_value)
	for key in deck_freq.keys():
		if deck_freq[key] > most_played_card_value:
			most_played_card_key = key
			most_played_card_value = deck_freq[key]
			
	
	
	var str = most_played_card_key.split("_")

	var rec_str = "%s/%s/%s_%s%s"
	rec_str = rec_str % [Constants.DEFAULT_CHISTES, str[1], str[2], str[3], Constants.SCENE_SUFFIX]
	
	print(rec_str)
	
	var card_load = load(rec_str)
	var card_instance =  card_load.instantiate()
	card_instance.position = Vector2 (1292, 90)
	card_instance.target_position = Vector2 (1292, 90)
	card_instance.set_script(null)
	call_deferred("add_child", card_instance)


func _on_continuar_pressed():
		get_tree().change_scene_to_file(Constants.PRE_BATTLE_SCENE)
