extends Node2D

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

func create_reactions():
	for reaction in Constants.ENEMY_REACTIONS:
		possible_reactions.append(reaction)

func create_enemy_reactions():
	create_reactions()
	for key in humors.keys():
		var index = randi() % possible_reactions.size()
		var reaction = possible_reactions[index]
		humors[key] = reaction
		possible_reactions.remove_at(index)	
	
	return humors
