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
	"res://Resource/card_parent/blanco/",
	"res://Resource/card_parent/verde/",
	"res://Resource/card_parent/negro/",
	"res://Resource/card_parent/meme/",
	"res://Resource/card_parent/inteligente/"
]

# --------------------------------------------------------------------------- #

# Deck constants

const DECK_SIZE = 7
const HAND_SIZE = 3
const CARD_POSITION = [Vector2(0,-50), Vector2(475,-50), Vector2(950, -50)]

# --------------------------------------------------------------------------- #

# Deck Creator constants
const DECK_CREATOR_PANEL_MIN_POSITION = 0
const DECK_CREATOR_PANEL_MAX_POSITION = -9600

# --------------------------------------------------------------------------- #

# Humor Reactions constants

const BEST_REACTION = "Me parto"
const GOOD_REACTION = "Gracioso"
const NORMAL_REACTION = "Ni fú ni fá"
const WORST_REACTION = "Ni puta gracia"
const EMPTY = ""

const HUMOR_REACTIONS = [EMPTY, BEST_REACTION, GOOD_REACTION, NORMAL_REACTION, WORST_REACTION]
const ENEMY_REACTIONS = [BEST_REACTION, GOOD_REACTION, GOOD_REACTION, NORMAL_REACTION, NORMAL_REACTION, WORST_REACTION]

const REACTIONS_LIMITS = {
	BEST_REACTION: 1,
	GOOD_REACTION: 2, 
	NORMAL_REACTION: 2,
	WORST_REACTION: 1,
	EMPTY: 0
}
# --------------------------------------------------------------------------- #

# Humor Types constants

const HUMOR_ABSURDO = "Absurdo"
const HUMOR_BLANCO = "Blanco"
const HUMOR_INT = "Inteligente"
const MEMES = "Meme"
const HUMOR_NEGRO = "Negro"
const HUMOR_VERDE = "Verde"

const HUMORES = [HUMOR_ABSURDO, HUMOR_BLANCO, HUMOR_INT, MEMES, HUMOR_NEGRO, HUMOR_VERDE]


# --------------------------------------------------------------------------- #

# Health constants

const INITIAL_HEALTH = 10

const REACTIONS_DAMAGES = {
	BEST_REACTION: 4,
	GOOD_REACTION: 2, 
	NORMAL_REACTION: 1,
	WORST_REACTION: 0,
	EMPTY: 0
}

# --------------------------------------------------------------------------- #

const PLAYER_NAME = "player"
const ENEMY_NAME = "enemy"

# --------------------------------------------------------------------------- #

# FSM Turns constants

const PLAYER_TURN_SIGNAL = "PlayerTurn"
const ENEMY_TURN_SIGNAL = "EnemyTurn"
const END_LEVEL_SIGNAL = "EndLevel"
const KEEP_PLAYING_SIGNAL = "KeepPlaying"
const WAITING_SIGNAL = "Waiting"

const NEXT_STATE = {
	PLAYER_TURN_SIGNAL : ENEMY_TURN_SIGNAL,
	ENEMY_TURN_SIGNAL : PLAYER_TURN_SIGNAL
}

# --------------------------------------------------------------------------- #

const WIN_PANEL_DEFAULT_POSITION = -650
const LOSE_PANEL_DEFAULT_POSITION = 1150

# --------------------------------------------------------------------------- #

const ICONS = [
	"res://Sprites/Enemies/Char_1.png",
	"res://Sprites/Enemies/Char_2.png",
	"res://Sprites/Enemies/Char_3.png",
	"res://Sprites/Enemies/Char_4.png",
	"res://Sprites/Enemies/Char_5.png"
]

const MAX_OPPONENTES = 5

# --------------------------------------------------------------------------- #

const WIN_SCENE = "res://Scenes/WinScene.tscn"
const PLAYER_CREATOR_SCENE = "res://Scenes/PlayerCreator/player_creator.tscn"
const DECK_CREATOR_SCENE = "res://Scenes/DeckCreator/deck_creator.tscn"
const GAME_SCENE = "res://Scenes/GamePlayScene/game.tscn"
const MAIN_MENU_SCENE = "res://Scenes/MainMenu/main_menu.tscn"
