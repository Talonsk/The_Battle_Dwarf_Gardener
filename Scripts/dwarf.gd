extends CharacterBody2D
@onready var hp_bar = $TextureProgressBar
const SPEED = 300.0
var health = 100
func  _ready():
	hp_bar.max_value = health
	
func _physics_process(delta):
	hp_bar.set_value(health)
	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down" )
	velocity.x = direction_x * SPEED
	velocity.y = direction_y * SPEED
	if direction_x != 0:
		$Sprite2D.scale.x = abs($Sprite2D.scale.x) * direction_x
		$Scissors.scale.x = abs($Scissors.scale.x) * direction_x
		$Scissors.scale.y = 1
		$Scissors.rotation = 0
		$Scissors.position.x = abs($Scissors.position.x) * direction_x 
	move_and_slide()
