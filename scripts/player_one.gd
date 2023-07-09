extends CharacterBody2D


const SPEED = 300.0

var collider


func _physics_process(delta):
	if not get_parent().block:
		var vel = Vector2()
		
		if Input.is_action_pressed("w"):
			vel.y -= SPEED
			
		if Input.is_action_pressed("a"):
			vel.x -= SPEED
			
		if Input.is_action_pressed("s"):
			vel.y += SPEED
			
		if Input.is_action_pressed("d"):
			vel.x += SPEED
		
		var col = move_and_collide(vel * delta)
		
		if col != null:
			collider = col.get_collider()
			
			if collider.name == "PlayerOneGoal":
				get_parent().call("disable_goal_collision")
			else:
				get_parent().call("enable_goal_collision")
