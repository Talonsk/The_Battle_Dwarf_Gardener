extends Node2D

@export var StagBeetle: PackedScene

func _on_timer_timeout():
	var stag_beetle = StagBeetle.instantiate()
	$"Path2D/PathFollow2D".add_child(stag_beetle)
