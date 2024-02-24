extends CharacterBody2D

func _ready():
	$CrawleduOutTimer.start()

func _on_crawledu_out_timer_timeout():
	var mole_spawn_location = $"../Dwarf/MoleRadius/MoleRadiusLocation"
	mole_spawn_location.progress_ratio = randf()
	$DamageZone.set_collision_mask_value(2,true)
	$AnimatedSprite2D.play("got_out")
	$".".set_collision_layer_value(3,true)
	$"Area2D".set_collision_mask_value(2,true)
	global_position = mole_spawn_location.global_position
	print("Крот преместился")
	$HidingTimer.start()

func _on_hiding_timer_timeout():
#	visible = false
	$AnimatedSprite2D.stop()
	if !$AnimatedSprite2D.is_playing():
		$DamageZone.set_collision_mask_value(2,false)
		$AnimatedSprite2D.play_backwards("got_out")
		$".".set_collision_layer_value(3,false)
		$"Area2D".set_collision_mask_value(2,false)
		print("Крот спрятался")
		$CrawleduOutTimer.start()
		$HidingTimer.stop()

	
func _on_area_2d_body_entered(body):
	$DamageZone.set_collision_mask_value(2,true)
	$AnimatedSprite2D.play("figtht")
	$AnimationPlayer.play("new_animation")
	if body.position.x > position.x:
		print("Гном справа")
		$AnimatedSprite2D.scale.x = abs($AnimatedSprite2D.scale.x) * -1
		$DamageZone.scale.x = abs($DamageZone.scale.x) * -1
	else:
		print("Гном слева")
		$AnimatedSprite2D.scale.x = abs($AnimatedSprite2D.scale.x)

func _on_damage_zone_body_entered(body):
	print("Гном ранен")
	body.health -= 5
	print(body.health)
