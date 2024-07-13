extends CharacterBody2D
@onready var MoleAnimation = $AnimatedSprite2D
@onready var Dwarf = $"/root/Main/Dwarf/"
@onready var UI = $"../CanvasLayer/UI"
@onready var MoleCollision = $Area2D
@onready var MoleBar = $MoleBar

var is_dead = false
var mole_health = 100

func _ready():
	MoleAnimation.set_animation("got_out")
	MoleBar.max_value = mole_health
	$CrawleduOutTimer.start()
	
func _process(delta):
	MoleBar.set_value(mole_health)
	death()

func _on_crawledu_out_timer_timeout():
	if mole_health < 25:
		MoleAnimation.play("wounded_mole")
	else:
		MoleAnimation.play("got_out")
		
	set_collision_layer_value(3,true)
	MoleCollision.set_collision_mask_value(2,true)
	MoleBar.visible = true
	
	var dwarf_position = Dwarf.global_position
	var mole_spawn_location = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	var Radius = 50
	global_position = dwarf_position + mole_spawn_location * Radius
	$HidingTimer.start()

func _on_hiding_timer_timeout():
	MoleAnimation.stop()
	if !MoleAnimation.is_playing():
		set_collision_layer_value(3,false)
		MoleCollision.set_collision_mask_value(2,false)
		MoleBar.visible = false
		$CrawleduOutTimer.start()
		$HidingTimer.stop()
		if mole_health < 25:
			MoleAnimation.play_backwards("wounded_mole")
		else:
			MoleAnimation.play_backwards("got_out")

func _on_area_2d_body_entered(body):
	body.health -= 5
	
	if mole_health < 25:
		MoleAnimation.play("wounded_figtht")
	else:
		MoleAnimation.play("figtht")
		
	if body.position.x > position.x:
		MoleAnimation.scale.x = abs(MoleAnimation.scale.x) * -1
	else:
		MoleAnimation.scale.x = abs(MoleAnimation.scale.x)

func _on_area_2d_body_exited(body):
	MoleAnimation.set_animation("got_out")
	MoleAnimation.set_frame(6)

func damage():
	mole_health -= 5
	
func death():
	if mole_health <= 0:
		if !is_dead:
			MoleAnimation.scale.x = abs(MoleAnimation.scale.x)
			MoleAnimation.play_backwards("death_animation")
			is_dead = true
		elif !MoleAnimation.is_playing():
			UI.score += 5
			UI.mole_count -= 1
			queue_free()

