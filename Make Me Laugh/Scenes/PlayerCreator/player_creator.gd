extends Node2D

@export var humor_negro_selector : OptionButton
@export var humor_blanco_selector : OptionButton
@export var humor_verde_selector : OptionButton
@export var humor_absurdo_selector : OptionButton
@export var humor_inteligente_selector : OptionButton
@export var memes_selector : OptionButton
@export var continue_button : Button
@export var reminder : Label

@onready var data_manager : Node2D = $DataManager

var selectors = []

var humor_reactions = []

var selections = {
	Constants.HUMOR_BLANCO: "",
	Constants.HUMOR_NEGRO: "",
	Constants.HUMOR_VERDE: "",
	Constants.HUMOR_INT: "",
	Constants.HUMOR_ABSURDO: "",
	Constants.MEMES: "",
}

var reactions_used = {
	Constants.BEST_REACTION: 0,
	Constants.GOOD_REACTION: 0, 
	Constants.NORMAL_REACTION: 0,
	Constants.WORST_REACTION: 0,
	Constants.EMPTY: 0
}

var reactions_limits 

func _ready():
	reactions_limits = Constants.REACTIONS_LIMITS
	selectors = [humor_negro_selector,humor_blanco_selector,humor_verde_selector,humor_absurdo_selector,humor_inteligente_selector,memes_selector]
	humor_reactions = Constants.HUMOR_REACTIONS

	for reaction in humor_reactions:
		for selector in selectors:
			selector.add_item(reaction)

func _on_humor_negro_selector_item_selected(index):
	selections[Constants.HUMOR_NEGRO] = humor_negro_selector.get_item_text(index)
	check_limit_selections()
	update_button()

func check_limit_selections():
	reactions_used = {
		Constants.EMPTY: 0,
		Constants.BEST_REACTION: 0,
		Constants.GOOD_REACTION: 0, 
		Constants.NORMAL_REACTION: 0,
		Constants.WORST_REACTION: 0
		}
	for selector in selectors:
		reactions_used[selector.get_item_text(selector.get_selected_id())] += 1
	
func update_button():
	continue_button.disabled = false
	reminder.visible = false
	for key in reactions_used.keys():
		if reactions_used[key] > reactions_limits[key]:
			continue_button.disabled = true
			reminder.visible = true

func _on_humor_verde_selector_item_selected(index):
	selections[Constants.HUMOR_VERDE] = humor_negro_selector.get_item_text(index)
	check_limit_selections()
	update_button()

func _on_humor_absurdo_selector_item_selected(index):
	selections[Constants.HUMOR_ABSURDO] = humor_negro_selector.get_item_text(index)
	check_limit_selections()
	update_button()

func _on_humor_blanco_selector_item_selected(index):
	selections[Constants.HUMOR_BLANCO] = humor_negro_selector.get_item_text(index)
	check_limit_selections()
	update_button()



func _on_humor_inteligente_selector_item_selected(index):
	selections[Constants.HUMOR_INT] = humor_negro_selector.get_item_text(index)
	check_limit_selections()
	update_button()



func _on_memes_selector_item_selected(index):
	selections[Constants.MEMES] = humor_negro_selector.get_item_text(index)
	check_limit_selections()
	update_button()



func _on_continue_button_pressed():
	data_manager.save_player_stats(selections)
