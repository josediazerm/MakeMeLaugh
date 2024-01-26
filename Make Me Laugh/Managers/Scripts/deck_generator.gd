extends Node2D

var paths
var chistes = []
var possible_chistes = []
var deck = []


func _ready():
	get_cards()
	generate_opponent_deck()


func get_cards():
	paths = Constants.CHISTES_FOLDERS
	
	for path in paths:
		var dir = DirAccess.open(path)

		if not dir:
			return
		
		for file in dir.get_files():
			if file.ends_with(Constants.REMAP_SUFFIX):
				file = file.trim_suffix(Constants.REMAP_SUFFIX)
			if file.ends_with(Constants.SCENE_SUFFIX):
				chistes.append(file.split(".")[0])


func generate_opponent_deck():
	possible_chistes = chistes
	
	for i in range(Constants.DECK_SIZE):
		var chiste = possible_chistes[randi() % possible_chistes.size()]
		deck.append(chiste)
		possible_chistes.erase(chiste)
