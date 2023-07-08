extends CharacterBody2D


const SPEED = 5.0


func _physics_process(delta):
	var vel = Vector2()
	
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("left", "right")
	if direction:
		vel.x += direction * SPEED
	else:
		vel.x = move_toward(velocity.x, 0, SPEED)
	
	direction = Input.get_axis("up", "down")
	if direction:
		vel.y += direction * SPEED
	else:
		vel.y = move_toward(velocity.y, 0, SPEED)

	var col = move_and_collide(vel)
	
	if col != null:
		var collider = col.get_collider()
		
		if collider.name == "PlayerTwoGoal":
			get_parent().call("disable_goal_collision", 2)
		else:
			get_parent().call("enable_goal_collision", 2)
