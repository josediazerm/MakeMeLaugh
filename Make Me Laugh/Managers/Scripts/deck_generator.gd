extends Node2D

var paths
var chistes = []
var possible_chistes = []
var deck = []


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
				chistes.append(path + file)


func generate_opponent_deck():
	get_cards()
	possible_chistes = []
	

	for chiste in chistes:
		possible_chistes.append(chiste)
	
	possible_chistes = chistes
	for i in range(Constants.DECK_SIZE):
		var chiste = possible_chistes[randi() % possible_chistes.size()]
		deck.append(chiste)
		possible_chistes.erase(chiste)
	
	return deck
