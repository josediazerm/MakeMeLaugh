extends Node2D

@onready var data_manager : Node2D = $DataManager

var reactions = []
var possible_reactions = []
var humors = {
Constants.HUMOR_BLANCO: "",
Constants.HUMOR_NEGRO: "",
Constants.HUMOR_VERDE: "",
Constants.HUMOR_INT: "",
Constants.HUMOR_ABSURDO: "",
Constants.MEMES: ""
}

func _ready():
	possible_reactions = Constants.ENEMY_REACTIONS
	create_enemy_reactions()

func create_enemy_reactions():
	for key in humors.keys():
		var reaction = possible_reactions[randi() % possible_reactions.size()]
		humors[key] = reaction
		possible_reactions.erase(reaction)
	data_manager.save_enemy_stats(humors)
