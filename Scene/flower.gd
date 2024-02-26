extends StaticBody2D
var random_texture  = int(randf_range(1, 4))
func _ready():
	$Sprite2D.texture = load("res://Image/flower%d.png" % random_texture)

