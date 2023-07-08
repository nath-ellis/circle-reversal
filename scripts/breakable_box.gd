extends StaticBody2D


@onready var selected = $Selected


func select():
	selected.show()


func deselect():
	selected.hide()


func break_self():
	queue_free()
