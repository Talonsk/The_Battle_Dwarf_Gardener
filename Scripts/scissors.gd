extends CharacterBody2D
var body_entered = false
var Body = Node2D

func _physics_process(delta):
	if Input.is_action_pressed("ui_accept"):
		$AnimatedSprite2D.play("cut_it")
		$Area2D.set_collision_mask_value(3, true)
	else:
		$AnimatedSprite2D.pause()
		$Area2D.set_collision_mask_value(3, false)
		
	if body_entered:
		Body.damage()

	move_and_slide()

func _on_area_2d_body_entered(body):
	body_entered = true
	Body = body

func _on_area_2d_body_exited(body):
	body_entered = false
	


