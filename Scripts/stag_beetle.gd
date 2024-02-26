extends CharacterBody2D
@onready var Dwarf = $"/root/Main/Dwarf"
@onready var Scissors = $"/root/Main/Dwarf/Scissors"
@onready var ScissorsAnimation = $"/root/Main/Dwarf/Scissors/AnimatedSprite2D"
@onready var StagBeetleHpBar = $TextureProgressBar
@onready var UI = $"../CanvasLayer/UI"

const SPEED = 300.0
var health = 100
var is_scissors_entered = false
func _ready():
	StagBeetleHpBar.max_value = health


func _process(delta):
	StagBeetleHpBar.set_value(health)
	var is_scissors_playing = ScissorsAnimation.is_playing()
	attack(is_scissors_playing)
	
	var diff = Dwarf.position - position
#	if diff <= Vector2(50, 50):
	position += diff/SPEED
	look_at(Dwarf.position)
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body == Scissors:
		is_scissors_entered = true
	if body == Dwarf:
		$AnimatedSprite2D.play("attack")
		Dwarf.health -= 10

func _on_area_2d_body_exited(body):
	if body == Scissors:
		is_scissors_entered = false
	else :
		$AnimatedSprite2D.stop()

func _on_damage_timer_timeout():
	health -= 25
	if health <= 0:
		UI.score += 5
		UI.stag_beetle_count -= 1
		queue_free()

func attack(is_attack):

	if is_attack and is_scissors_entered:
		if $DamageTimer.is_stopped():
			$DamageTimer.start()
	else:
		$DamageTimer.stop()
