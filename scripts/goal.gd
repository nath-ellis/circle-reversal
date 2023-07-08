extends StaticBody2D


@onready var sprite = $Sprite2D
@onready var hitbox = $CollisionShape2D


func _ready():
	if name == "PlayerOneGoal":
		sprite.texture = load("res://assets/goal_player_one.png")
	else:
		sprite.texture = load("res://assets/goal_player_two.png")
