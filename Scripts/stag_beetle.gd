extends CharacterBody2D
@onready var Dwarf = $"/root/Main/Dwarf"
@onready var Scissors = $"/root/Main/Dwarf/Scissors"
const SPEED = 300.0
var health = 100

func _physics_process(delta):

	position += (Dwarf.position - position)/SPEED
	look_at(Dwarf.position)
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body == Scissors:
		$Timer.start()
	if body == Dwarf:
		Dwarf.health -= 10

func _on_area_2d_body_exited(body):
	if body == Scissors:
		$Timer.stop()
	
func _on_timer_timeout():
	health -= 25
	if health <= 0:
		queue_free()
