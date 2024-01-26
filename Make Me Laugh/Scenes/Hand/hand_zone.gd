extends Panel

@export var data_manager : Node2D 


# Called when the node enters the scene tree for the first time.
func _ready():
	var deck = data_manager.get_player_deck()
	for card in deck:
		var string_prueba = Constants.DEFAULT_CHISTES + card + Constants.SCENE_SUFFIX
		var card_load = load(string_prueba)	
		var card_instance =  card_load.instantiate() 
		call_deferred("add_child", card_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
