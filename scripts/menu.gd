extends Control


@onready var play = $Play
@onready var level_select = $LevelSelect


func _on_play_pressed():
	level_select.show()
	play.hide()


func _level_selected(scene):
	get_tree().change_scene_to_file("res://scenes/" + scene + ".tscn")
