extends Panel

@export var chiste_text : Label
@export var chiste_image : Sprite2D

@export var turn_manager : Node2D

@export var enemy_theme : Theme
@export var player_theme : Theme

func show_joke(text : String, image : Texture):
	visible = true
	chiste_text.text = text
	chiste_image.texture = image

func hide_joke():
	visible = false

func set_style(who : String):
	if who == Constants.PLAYER_NAME:
		theme = player_theme
	else:
		theme = enemy_theme
