extends Node2D


func _on_play_pressed():
	Global.opponent_number = 0
	get_parent().add_next_child(Constants.PLAYER_CREATOR_SCENE, self)

func _on_exit_pressed():
	get_tree().quit()
