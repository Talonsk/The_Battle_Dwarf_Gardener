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
	if direction_x != 0:
		$Sprite2D.scale.x = abs($Sprite2D.scale.x) * direction_x
		$Scissors.scale.x = abs($Scissors.scale.x) * direction_x
		$Scissors.position.x = abs($Scissors.position.x) * direction_x 
		
	if Input.is_action_pressed("ui_accept"):
		$Scissors/AnimatedSprite2D.play("cut_it")
	else:
		$Scissors/AnimatedSprite2D.pause()
	move_and_slide()
