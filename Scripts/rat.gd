extends CharacterBody2D
@onready var UI = $"/root/Main/CanvasLayer/UI"
@onready var Dwarf = $"/root/Main/Dwarf/"
@onready var RatAnimation = $AnimatedSprite2D
@onready var RatProgressBar = $TextureProgressBar

const SPEED = 50.0
var rat_hp = 75

func _ready():
	RatProgressBar.max_value = rat_hp

func _process(delta):
	RatProgressBar.set_value(rat_hp)
	
	if Dwarf.position.x > position.x:
		RatAnimation.scale.x = abs(RatAnimation.scale.x)
		RatProgressBar.scale.x = abs(RatProgressBar.scale.x)
	else:
		RatAnimation.scale.x = -abs(RatAnimation.scale.x)
		RatProgressBar.scale.x = -abs(RatProgressBar.scale.x)
	if int(Dwarf.position.y) == int(position.y) or int(velocity.x) == 0:
		RatAnimation.play("jamp")
		velocity.x = (Dwarf.position.x - position.x) * delta * 10
#	elif abs(Dwarf.position.y - position.y) > 10:
#		velocity.x = 0
	if Dwarf.position.y > position.y:
		velocity.y = SPEED
	else:
		velocity.y = -SPEED
	
	death()
	move_and_slide()

func _on_area_2d_body_entered(body):
	$AttackTimer.start()

func _on_area_2d_body_exited(body):
	$AttackTimer.stop()

func _on_attack_timer_timeout():
	Dwarf.health -= 1
	
func damage():
	rat_hp -= 5
	
func death():
	if rat_hp <= 0:
		UI.score += 1
		UI.rat_count -= 1
		queue_free()






