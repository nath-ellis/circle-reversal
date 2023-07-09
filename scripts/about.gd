extends Control


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_github_pressed():
	OS.shell_open("https://github.com/nath-ellis")
