extends Node2D

@export var music_manager : Node2D

func add_next_child(path, child):
	var child_load = load(path)	
	var child_instance =  child_load.instantiate()
	child.queue_free()	
	call_deferred("add_child", child_instance)

func _ready():
	music_manager.play(Constants.MENU_SOLO_INICIO_MUSIC )


func _on_music_finished():
	music_manager.play(Constants.MENU_SIN_INICIO_MUSIC )
