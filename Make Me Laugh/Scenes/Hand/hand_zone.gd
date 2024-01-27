extends Panel

@export var data_manager : Node2D 
@export var turn_manager : Node2D 
@export var health_manager : Node2D 


# Called when the node enters the scene tree for the first time.
func _ready():
	var deck = data_manager.get_player_deck()
	for card in deck:
		var string_prueba = Constants.DEFAULT_CHISTES + card + Constants.SCENE_SUFFIX
		var card_load = load(string_prueba)	
		var card_instance =  card_load.instantiate() 
		call_deferred("add_child", card_instance)

func card_played(card_humor_type):
	#turn_manager.player_card_played()
	print(card_humor_type.text)
	health_manager.apply_damage(Constants.PLAYER_NAME, card_humor_type.text)
