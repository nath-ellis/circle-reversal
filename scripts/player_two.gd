extends CharacterBody2D


const SPEED = 300.0


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
			var collider = col.get_collider()
			
			if collider.name == "PlayerTwoGoal":
				get_parent().call("disable_goal_collision", 2)
			else:
				get_parent().call("enable_goal_collision", 2)
