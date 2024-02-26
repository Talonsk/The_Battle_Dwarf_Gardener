extends Node2D

@export var StagBeetle: PackedScene
@export var Mole: PackedScene
@export var Rat: PackedScene
@onready var UI = $CanvasLayer/UI

func _process(delta):
	if UI.is_new_raund_start == true and $InsectsSpawnTimer.is_stopped():
		$InsectsSpawnTimer.start()
		mole_spawn()
		rat_spawn()

func _on_timer_timeout():
	for i in range(UI.raund * 2):
		if i%3 == 0:
			var stag_beetle = StagBeetle.instantiate()
			var insects_spawn_location = $"Path2D/PathFollow2D"
			insects_spawn_location.progress_ratio = randf()
			stag_beetle.position = insects_spawn_location.position
			add_child(stag_beetle)
			UI.stag_beetle_count += 1
	UI.is_new_raund_start = false

func mole_spawn():
	for x in range(UI.raund):
		var mole = Mole.instantiate()
		mole.position = Vector2(randf_range(-50, 340), randf_range(-50, 340))
		add_child(mole)
		UI.mole_count += 1

func rat_spawn():
	for x in range((UI.raund-1)*2):
		var rat = Rat.instantiate()
		var rat_spawn_location_x = $"Path2D/PathFollow2D"
		var rat_spawn_location_y = $"Path2D/PathFollow2D"
		rat_spawn_location_x.progress_ratio = randf()
		rat_spawn_location_y.progress_ratio = randf()
		rat.position = Vector2(rat_spawn_location_x.position.x, rat_spawn_location_y.position.y)
		add_child(rat)
		UI.rat_count += 1
