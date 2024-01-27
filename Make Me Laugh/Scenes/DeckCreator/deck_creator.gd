extends Node2D

@onready var panel : Panel = $Panel
@onready var continue_button : Button = $Continue
@onready var deck_label : Label = $Deck_Label
@onready var data_manager : Node2D = $DataManager

var slider_range = 0

var deck = []

func _ready():
	slider_range = Constants.DECK_CREATOR_PANEL_MAX_POSITION - Constants.DECK_CREATOR_PANEL_MIN_POSITION

func _on_h_slider_value_changed(value):
	panel.position[0] = slider_range / 100 * value

func add_or_remove_from_deck(card : String):
	if card in deck:
		deck.erase(card)
	else:
		deck.append(card)
	
	deck_label.text = str(deck.size())
	
	if deck.size() < Constants.DECK_SIZE :
		continue_button.disabled = true
	else:
		continue_button.disabled = false

func _on_button_pressed(extra_arg_0):
	add_or_remove_from_deck(extra_arg_0)


func _on_continue_pressed():
	data_manager.save_player_deck(deck)


