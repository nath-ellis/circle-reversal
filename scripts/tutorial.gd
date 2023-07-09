extends Control


@onready var root = $"."
@onready var page_1 = $Page1
@onready var page_2 = $Page2


func _on_done_pressed():
	if page_1.visible:
		page_1.hide()
		page_2.show()
	else:
		root.hide()
