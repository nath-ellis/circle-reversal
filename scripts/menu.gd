extends Control


@onready var play = $Play
@onready var about = $About
@onready var level_select = $LevelSelect


func _on_play_pressed():
	level_select.show()
	play.hide()
	about.hide()


func _level_selected(scene):
	get_tree().change_scene_to_file("res://scenes/levels/" + scene + ".tscn")


func _on_about_pressed():
	get_tree().change_scene_to_file("res://scenes/about.tscn")
