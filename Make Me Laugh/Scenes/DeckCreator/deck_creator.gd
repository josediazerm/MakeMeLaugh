extends Node2D

@onready var panel : Panel = $Control/Cartas
@onready var continue_button : Button = $Control/Panel_Información/Continue
@onready var deck_label : Label = $Control/Panel_Información/Deck_Size
@onready var data_manager : Node2D = $Control/DataManager
@onready var deck_info : Label = $Control/Panel_Información/Deck_Data

var last_button_pressed

var humores_counter = {}
var slider_range = 0

var deck = []

func _ready():
	slider_range = Constants.DECK_CREATOR_PANEL_MAX_POSITION - Constants.DECK_CREATOR_PANEL_MIN_POSITION
	update_label()
	data_manager.reset_card_played_tmp_deck()
	data_manager.reset_card_played_deck()

func _on_h_slider_value_changed(value):
	panel.position[0] = slider_range / 100 * value

func add_or_remove_from_deck(card : String):
	if card in deck:
		deck.erase(card)
	else:
		if deck.size() < Constants.DECK_SIZE:
			deck.append(card)
		else:
			get_node(last_button_pressed).button_pressed = false
	deck_label.text = str(deck.size())
	
	if deck.size() < Constants.DECK_SIZE :
		continue_button.disabled = true
	else:
		continue_button.disabled = false

func _on_button_pressed(extra_arg_0):
	
	var button = extra_arg_0.split("/")[2]
	last_button_pressed = "Control/Cartas/%s"
	last_button_pressed = last_button_pressed % button

	add_or_remove_from_deck(extra_arg_0)
	update_label()

func _on_continue_pressed():
	data_manager.save_player_deck(deck)
	get_parent().add_next_child(Constants.POWER_POINT_SCENE, self)

func update_label():
	create_dict_counter()
	
	for card in deck:
		var string_prueba = Constants.DEFAULT_CHISTES + card + Constants.SCENE_SUFFIX
		var card_load = load(string_prueba)	
		var card_instance =  card_load.instantiate()
		humores_counter[card_instance.get_chiste_type()] += 1
	
	type_label()
	
func create_dict_counter():
	humores_counter = {}
	for humor in Constants.HUMORES:
		humores_counter[humor] = 0

func type_label():
	var text = ""
	var things_to_show = []
	for humor in humores_counter.keys():
		text += "%s : %d \n"
		things_to_show.append(humor)
		things_to_show.append(humores_counter[humor])
	text = text % things_to_show
	deck_info.text = text
