extends Control


func _on_next_pressed():
	var level_number_label = $"../LevelNumber"
	var level_number = int(level_number_label.text)
	
	match level_number:
		1:
			get_tree().change_scene_to_file("res://scenes/levels/level_two.tscn")
		2:
			get_tree().change_scene_to_file("res://scenes/levels/level_three.tscn")
		3:
			get_tree().change_scene_to_file("res://scenes/levels/level_four.tscn")
		4:
			get_tree().change_scene_to_file("res://scenes/levels/level_five.tscn")
		5:
			get_tree().change_scene_to_file("res://scenes/levels/level_six.tscn")
		6:
			get_tree().change_scene_to_file("res://scenes/levels/level_seven.tscn")
		7:
			get_tree().change_scene_to_file("res://scenes/levels/level_eight.tscn")
		8:
			get_tree().change_scene_to_file("res://scenes/levels/level_nine.tscn")
		9:
			get_tree().change_scene_to_file("res://scenes/levels/level_ten.tscn")
		10:
			pass


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
