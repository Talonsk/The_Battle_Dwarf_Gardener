extends Node2D

@export var StagBeetle: PackedScene
@onready var UI = $CanvasLayer/UI

func _on_timer_timeout():
	for i in range(UI.raund):
		var stag_beetle = StagBeetle.instantiate()
		var insects_spawn_location = $"Path2D/PathFollow2D"
		insects_spawn_location.progress_ratio = randf()
		stag_beetle.position = insects_spawn_location.position
		add_child(stag_beetle)
	
