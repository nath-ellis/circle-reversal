extends CharacterBody2D


const SPEED = 300.0

var collider
var time


func _physics_process(delta):
	if not get_parent().block:
		var vel = Vector2()
		
		if Input.is_action_pressed("up"):
			vel.y -= SPEED
			
		if Input.is_action_pressed("left"):
			vel.x -= SPEED
			
		if Input.is_action_pressed("down"):
			vel.y += SPEED
			
		if Input.is_action_pressed("right"):
			vel.x += SPEED
		
		var col = move_and_collide(vel * delta)
		
		if col != null:
			# Deselect old box if needed
			if collider != null and collider.has_method("deselect"):
				collider.call("deselect")
			
			collider = col.get_collider()
			
			# Select box if collided with one
			if collider.has_method("select"):
				time = Time.get_unix_time_from_system()
				collider.call("select")
			
			# Disable collision on the goal if the correct player collides
			if collider.name == "PlayerTwoGoal":
				get_parent().call("disable_goal_collision", 2)
			else:
				get_parent().call("enable_goal_collision", 2)
		
		# Deselect after 1 second
		if time != null and collider != null and Time.get_unix_time_from_system() > time + 1:
			if collider.has_method("deselect"):
				collider.call("deselect")
				collider = null
				time = null
		
		# Break boxes
		if Input.is_action_pressed("player_2_action") and collider != null:
			if collider.has_method("break_self"):
				collider.call("break_self")
