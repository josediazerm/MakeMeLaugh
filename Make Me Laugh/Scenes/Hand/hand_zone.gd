extends Panel

@export var data_manager : Node2D 
@export var turn_manager : Node2D 
@export var health_manager : Node2D 

@export var bocadillo : Panel

var deck 
var hand = []
var last_hand = []
var possible_hand = []
var card_index


# Called when the node enters the scene tree for the first time.
func _ready():
	deck = data_manager.get_player_deck()

func create_hand():
	hand = []
	possible_hand = []

	for card in deck:
		if card not in last_hand:
			possible_hand.append(card)

	for i in range(Constants.HAND_SIZE):
		var index = randi() % possible_hand.size()
		var card = possible_hand[index]
		hand.append(card)
		possible_hand.remove_at(index)

	last_hand = []
	for card in hand:
		last_hand.append(card)

	card_index = 0
	for card in hand:
		var string_prueba = Constants.DEFAULT_CHISTES + card + Constants.SCENE_SUFFIX
		var card_load = load(string_prueba)
		var card_instance =  card_load.instantiate()
		card_instance.target_position = Constants.CARD_POSITION[card_index]
		card_instance.position = Constants.CARD_POSITION_DEFAULT
		card_instance.scale = Vector2(0.25, 0.25)
		call_deferred("add_child", card_instance)
		card_index += 1


func card_played(chiste_text, chiste_type, image_holder):
	bocadillo.show_joke(chiste_text, image_holder.texture)
	health_manager.apply_damage(Constants.PLAYER_NAME, chiste_type)

func destroy_hand():
	for child in get_children():
		child.queue_free()

func reset_hand():
	last_hand = []
	hand = []
	possible_hand = []
