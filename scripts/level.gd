extends Node


@onready var player_one = $PlayerOne
@onready var player_two = $PlayerTwo
@onready var player_one_hitbox = $PlayerOne/CollisionShape2D
@onready var player_two_hitbox = $PlayerTwo/CollisionShape2D
@onready var player_one_goal_hitbox = $PlayerOneGoal/CollisionShape2D
@onready var player_two_goal_hitbox = $PlayerTwoGoal/CollisionShape2D
@onready var player_one_particles = $PlayerOne/CPUParticles2D
@onready var player_two_particles = $PlayerTwo/CPUParticles2D
@onready var player_swoosh_sfx = $PlayerOne/Swoosh
@onready var pathways = $Pathways
@onready var level_complete = $LevelComplete
@onready var level_complete_sfx = $LevelComplete/LevelCompleteSFX
@onready var timer = $Timer
@onready var time_left_label = $TimeLeft
var block = false  # Prevent player movement while swapping positions
var played_level_complete_sfx = false


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


func _process(_delta):
	if player_one_goal_hitbox.disabled and player_two_goal_hitbox.disabled:
		timer.paused = true
		
		player_one_particles.emitting = true
		player_two_particles.emitting = true
		
		if !level_complete_sfx.playing and !played_level_complete_sfx:
			level_complete_sfx.play()
			played_level_complete_sfx = true
			
			if name == "LevelTen":
				$HeartAnimation.play("reunion")
				$Heart.show()
		
		level_complete.show()
	
	time_left_label.text = str(int(timer.time_left))


func _physics_process(_delta):
	if Input.is_action_just_released("reverse"):
		player_swoosh_sfx.playing = true
		
		player_one_particles.emitting = true
		player_two_particles.emitting = true
		
		block = true
		
		# Re-enable collisions
		enable_goal_collision()
		enable_goal_collision(2)
		
		var player_one_pos = player_one.global_position
		var player_two_pos = player_two.global_position
		
		player_one.global_position = player_two_pos
		player_two.global_position = player_one_pos
	else:
		block = false


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
