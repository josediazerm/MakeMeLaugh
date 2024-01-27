extends Panel

@export var chiste_text : Label
@export var chiste_image : Sprite2D
@export var timer : Timer
@export var turn_manager : Node2D

func show_joke(text : String, image : Texture):
	visible = true
	chiste_text.text = text
	chiste_image.texture = image
	timer.start()

func hide_joke():
	visible = false

func _on_timer_timeout():
	hide_joke()
	turn_manager.joke_ended()
