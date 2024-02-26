extends CharacterBody2D
@onready var ScissorsAnimation = $"/root/Main/Dwarf/Scissors/AnimatedSprite2D"
@onready var Scissors = $"/root/Main/Dwarf/Scissors"
@onready var MoleAnimation = $AnimatedSprite2D
@onready var Dwarf = $"/root/Main/Dwarf/"
@onready var UI = $"../CanvasLayer/UI"
@onready var MoleCollision = $Area2D
@onready var MoleBar = $MoleBar

var body_entered = false
var is_plaing = true
var mole_health = 50

func _ready():
	MoleBar.max_value = mole_health
	$CrawleduOutTimer.start()
	
func _process(delta):
	MoleBar.set_value(mole_health)
	var is_scissors_playing = ScissorsAnimation.is_playing()
	underground_attack(is_scissors_playing, delta*10)

func _on_crawledu_out_timer_timeout():
	MoleAnimation.play("got_out")
	set_collision_layer_value(3,true)
	MoleCollision.set_collision_mask_value(2,true)
	MoleCollision.set_collision_mask_value(4,true)
	MoleBar.visible = true
	
	var dwarf_position = Dwarf.global_position
	var mole_spawn_location = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	var Radius = 50
	global_position = dwarf_position + mole_spawn_location * Radius
	$HidingTimer.start()

func _on_hiding_timer_timeout():
	MoleAnimation.stop()
	if !MoleAnimation.is_playing():
		MoleAnimation.play_backwards("got_out")
		set_collision_layer_value(3,false)
		MoleCollision.set_collision_mask_value(2,false)
		MoleCollision.set_collision_mask_value(4,false)
		MoleBar.visible = false
		$CrawleduOutTimer.start()
		$HidingTimer.stop()

func _on_area_2d_body_entered(body):
	MoleAnimation.play("figtht")
	if body == Scissors:
		body_entered = true
	else:
#		body.health -= 5
		if body.position.x > position.x:
			MoleAnimation.scale.x = abs(MoleAnimation.scale.x) * -1
		else:
			MoleAnimation.scale.x = abs(MoleAnimation.scale.x)

func _on_area_2d_body_exited(body):
	MoleAnimation.set_animation("got_out")
	MoleAnimation.set_frame(6)
	if body == Scissors:
		body_entered = false

func underground_attack(is_plaing, damege):
	if is_plaing and body_entered:
		mole_health -= damege
	if mole_health <= 0:
		UI.score += 5
		UI.mole_count -= 1
		queue_free()
