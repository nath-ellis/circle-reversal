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
var block = false  # Prevent player movement while swapping positions


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


func enable_pathway_collision():
	if pathways.get_child_count() > 0:
		for p in pathways.get_children():
			p.get_child(1).disabled = false


func disable_pathway_collision():
	if pathways.get_child_count() > 0:
		for p in pathways.get_children():
			p.get_child(1).disabled = true


func _process(_delta):
	if player_one_goal_hitbox.disabled and player_two_goal_hitbox.disabled:
		player_one_particles.emitting = true
		player_two_particles.emitting = true
		
		level_complete.show()


func _physics_process(_delta):
	if Input.is_action_just_released("reverse"):
		player_swoosh_sfx.playing = true
		
		player_one_particles.emitting = true
		player_two_particles.emitting = true
		
		block = true
		
		# Re-enable collisions
		enable_goal_collision()
		enable_goal_collision(2)
		enable_pathway_collision()
		
		var player_one_pos = player_one.global_position
		var player_two_pos = player_two.global_position
		
		player_one.global_position = player_two_pos
		player_two.global_position = player_one_pos
	else:
		block = false
