extends AudioStreamPlayer2D


@onready var root = $"."


func _on_finished():
	root.play()
