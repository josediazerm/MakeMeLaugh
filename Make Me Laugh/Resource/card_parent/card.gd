extends Node2D

@export var chiste_text : String
@export var chiste_type : String

@export var chiste_image : Sprite2D
@export var chiste_label : Label
@export var type_label : Label
@export var image_holder : Sprite2D
@export var background : Panel


var initial_position : Vector2

var draggable = false
var is_in_drop_zone = false
var offset


func _ready():
	chiste_label.text = chiste_text
	type_label.text = chiste_type

func _on_area_2d_mouse_entered():
	if not Global.is_dragging:
		draggable = true
		scale = Vector2(1.1, 1.1)


func _on_area_2d_mouse_exited():
	if not Global.is_dragging:
		draggable = false
		scale = Vector2(1, 1)


func _on_area_2d_body_entered(body):
	if body.is_in_group('dropable'):
		is_in_drop_zone = true

func _on_area_2d_body_exited(_body):
		is_in_drop_zone = false

func _process(_delta):
	if draggable:
		if Input.is_action_just_pressed("Click"):
			initial_position = global_position 
			offset = get_global_mouse_position() - global_position 
			Global.is_dragging = true

		if Input.is_action_pressed("Click"):
			global_position = get_global_mouse_position() - offset

		if Input.is_action_just_released("Click"):
			Global.is_dragging = false
			if is_in_drop_zone:
				get_parent().card_played(type_label)
			else:
				var tween = get_tree().create_tween()
				tween.tween_property(self, "global_position", initial_position, 0.4).set_ease(Tween.EASE_OUT)


func get_chiste_type():
	return chiste_type
