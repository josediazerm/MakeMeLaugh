extends Resource
class_name SaveSystem

const path = Constants.LOCAL_SAVE_DATA_PATH

@export var player_deck : Array

func write_savedata() -> void:
	ResourceSaver.save(self, path)

# This function will return saved data or null if it doesnt exist.
static func load_savedata() -> Resource:
	var data = null
	if ResourceLoader.exists(path):
		data = ResourceLoader.load(path)
	return data

static func save_exists() -> bool:
	return ResourceLoader.exists(path)
