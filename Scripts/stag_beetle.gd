extends CharacterBody2D
@onready var Dwarf = $"/root/Main/Dwarf"
@onready var StagBeetleHpBar = $TextureProgressBar
@onready var UI = $"../CanvasLayer/UI"

const SPEED = 300.0
var health = 100

func _ready():
	StagBeetleHpBar.max_value = health

func _process(delta):
	StagBeetleHpBar.set_value(health)

	var diff = Dwarf.position - position
#	if diff <= Vector2(50, 50):
	position += diff/SPEED
	look_at(Dwarf.position)
	
	death()
	move_and_slide()

func _on_area_2d_body_entered(body):
	$AnimatedSprite2D.play("attack")
	Dwarf.health -= 10

func _on_area_2d_body_exited(body):
	$AnimatedSprite2D.stop()

func damage():
	health -= 2
	
func death():
	if health <= 0:
		UI.score += 5
		UI.stag_beetle_count -= 1
		queue_free()
