extends Node


@onready var player_one_goal_hitbox = $PlayerOneGoal/CollisionShape2D
@onready var player_two_goal_hitbox = $PlayerTwoGoal/CollisionShape2D


func enable_goal_collision(player = 1):
	if player == 1:
		player_one_goal_hitbox.disabled = false
	else:
		player_two_goal_hitbox.disabled = false


func disable_goal_collision(player = 1):
	if player == 1:
		player_one_goal_hitbox.disabled = true
	else:
		player_two_goal_hitbox.disabled = true


func _process(delta):
	if player_one_goal_hitbox.disabled and player_two_goal_hitbox.disabled:
		print("Winner")
