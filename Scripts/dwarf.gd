extends CharacterBody2D

const SPEED = 300.0
var health = 210

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down" )
	velocity.x = direction_x * SPEED
	velocity.y = direction_y * SPEED
	

	move_and_slide()
