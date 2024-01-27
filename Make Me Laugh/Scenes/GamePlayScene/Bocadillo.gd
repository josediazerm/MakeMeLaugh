extends Panel

@export var chiste_text : Label
@export var chiste_image : Sprite2D

@export var turn_manager : Node2D

func show_joke(text : String, image : Texture):
	visible = true
	chiste_text.text = text
	chiste_image.texture = image

func hide_joke():
	visible = false

