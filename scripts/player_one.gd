extends CharacterBody2D


const SPEED = 5.0


func _physics_process(delta):
	var vel = Vector2()
	
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("a", "d")
	if direction:
		vel.x += direction * SPEED
	else:
		vel.x = move_toward(velocity.x, 0, SPEED)
	
	direction = Input.get_axis("w", "s")
	if direction:
		vel.y += direction * SPEED
	else:
		vel.y = move_toward(velocity.y, 0, SPEED)

	var col = move_and_collide(vel)
	
	if col != null:
		var collider = col.get_collider()
		
		if collider.name == "PlayerOneGoal":
			get_parent().call("disable_goal_collision")
		else:
			get_parent().call("enable_goal_collision")
