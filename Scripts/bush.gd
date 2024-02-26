extends StaticBody2D
@onready var ScissorsAnimation = $"/root/Main/Dwarf/Scissors/AnimatedSprite2D"
@onready var UI = $"../CanvasLayer/UI"
@onready var picture = $AnimatedSprite2D
var is_body_entered = false

func _process(delta):
	var is_scissors_playing = ScissorsAnimation.is_playing()
	change_animation(is_scissors_playing)
	
	
func _on_area_2d_body_entered(body):
	is_body_entered  = true
	
func _on_area_2d_body_exited(body):
	is_body_entered  = false

func change_animation(is_plaing):
	if is_plaing and is_body_entered:
		if picture.get_frame() == 0:
			UI.score += 1
		picture.set_frame_and_progress(1, 1)





