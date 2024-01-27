extends Panel

@export var chiste_text : Label
@export var chiste_image : Sprite2D
@export var timer : Timer

func show_joke(text : String, image : Sprite2D):
	visible = true
	chiste_text.text = text
	chiste_image = image
	timer.start()

func hide_joke():
	visible = false

func _on_timer_timeout():
	hide_joke()
