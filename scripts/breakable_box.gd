extends StaticBody2D


@onready var hitbox = $CollisionShape2D
@onready var selected = $Selected
@onready var break_sfx = $Break


func select():
	selected.show()


func deselect():
	selected.hide()


func break_self():
	break_sfx.play()
	hide()
	hitbox.disabled = true


func _on_break_finished():
	queue_free()
