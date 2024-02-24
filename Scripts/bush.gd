extends StaticBody2D
const Dwarf = preload("res://Scene/dwarf.tscn")
var dwarf = Dwarf.instantiate()
func _on_area_2d_body_entered(body):
	if body == $"../Dwarf" or body == $"../Dwarf/Scissors":
		var picture = $AnimatedSprite2D
		picture.set_frame_and_progress(1, 1)
