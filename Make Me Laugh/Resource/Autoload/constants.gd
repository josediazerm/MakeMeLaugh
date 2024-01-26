# Path constants

const LOCAL_SAVE_DATA_PATH: String = "res://save_data.tres"
const USER_SAVE_DATA_PATH: String = "user://save_data.tres"

# --------------------------------------------------------------------------- #

# Suffix and preffix constants


const SCENE_SUFFIX = ".tscn"
const REMAP_SUFFIX = ".remap"

# --------------------------------------------------------------------------- #

# Images constants

const DEFAULT_IMAGE : String = "res://icon.svg"

# --------------------------------------------------------------------------- #

# Chistes folders

const DEFAULT_CHISTES = "res://Resource/card_parent"

const CHISTES_FOLDERS = [
	"res://Resource/card_parent/absurdo/",
	"res://Resource/card_parent/blanco/"
]

# --------------------------------------------------------------------------- #

# Deck constants

const DECK_SIZE = 7

# --------------------------------------------------------------------------- #

# Deck Creator constants

const DECK_CREATOR_PANEL_MIN_POSITION = 0
const DECK_CREATOR_PANEL_MAX_POSITION = -1228

# --------------------------------------------------------------------------- #

# Humor Reactions constants

const BEST_REACTION = "Me parto"
const GOOD_REACTION = "Gracioso"
const NORMAL_REACTION = "Ni fú ni fá"
const WORST_REACTION = "Ni puta gracia"
const EMPTY = ""

const HUMOR_REACTIONS = [EMPTY, BEST_REACTION, GOOD_REACTION, NORMAL_REACTION, WORST_REACTION]
const REACTIONS_LIMITS = {
	BEST_REACTION: 1,
	GOOD_REACTION: 2, 
	NORMAL_REACTION: 2,
	WORST_REACTION: 1,
	EMPTY: 0
}
# --------------------------------------------------------------------------- #


# Humor Types constants

const HUMOR_BLANCO = "Humor blanco"
const HUMOR_NEGRO = "Humor negro"
const HUMOR_VERDE = "Humor verde"
const HUMOR_INT = "Humor Inteligente"
const HUMOR_ABSURDO = "Humor Absurdo"
const MEMES = "Memes"

# --------------------------------------------------------------------------- #

