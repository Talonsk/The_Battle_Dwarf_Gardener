extends CharacterBody2D
@onready var UI = $"../CanvasLayer/UI"
@onready var Dwarf = $"/root/Main/Dwarf/"
@onready var RatAnimation = $AnimatedSprite2D
@onready var RatProgressBar = $TextureProgressBar
@onready var Scissors = "/root/Main/Dwarf/Scissors"

const SPEED = 50.0
var rat_hp = 75
var is_scissors_playing = false

func _ready():
	RatProgressBar.max_value = rat_hp

func _process(delta):
	if Dwarf.position.x > position.x:
		RatAnimation.scale.x = abs(RatAnimation.scale.x)
		RatProgressBar.scale.x = abs(RatProgressBar.scale.x)
	else:
		RatAnimation.scale.x = -abs(RatAnimation.scale.x)
		RatProgressBar.scale.x = -abs(RatProgressBar.scale.x)
	if int(Dwarf.position.y) == int(position.y) or int(velocity.x) == 0:
		RatAnimation.play("jamp")
		velocity.x = (Dwarf.position.x - position.x) * delta * 100
#	elif abs(Dwarf.position.y - position.y) > 10:
#		velocity.x = 0
	if Dwarf.position.y > position.y:
		velocity.y = SPEED
	else:
		velocity.y = -SPEED
	RatProgressBar.set_value(rat_hp)
	
	is_scissors_playing = get_node("%s/AnimatedSprite2D" % Scissors).is_playing()
	if is_scissors_playing:
		get_node("%s"%Scissors).set_collision_layer_value(4,true)
	else:
		get_node("%s"%Scissors).set_collision_layer_value(4, false)

	move_and_slide()

func _on_area_2d_body_entered(body):
	$AttackTimer.start()
	if rat_hp <= 0:
		get_node("%s"%Scissors).set_collision_layer_value(4,true)
		UI.score += 1
		UI.rat_count -= 1
		queue_free()
	elif is_scissors_playing:
		rat_hp -= 5

func _on_attack_timer_timeout():
	Dwarf.health -= 1
