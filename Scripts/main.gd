extends Node2D

@export var StagBeetle: PackedScene

func _on_timer_timeout():
	var stag_beetle = StagBeetle.instantiate()
	var insects_spawn_location = $"Path2D/PathFollow2D"
	insects_spawn_location.progress_ratio = randf()
	stag_beetle.position = insects_spawn_location.position
	add_child(stag_beetle)
	
