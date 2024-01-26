extends Node2D

@export var chiste_text : String = "Texto"
@export var chiste_type : String = "Tipo"

@export var chiste_image : Sprite2D
@export var chiste_label : Label
@export var type_label : Label
@export var image_holder : Sprite2D
@export var background : Panel


func _ready():
	chiste_label.text = chiste_text
	type_label.text = chiste_type
