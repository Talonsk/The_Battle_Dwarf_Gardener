extends Control

@onready var Score = $HBoxContainer/Score
@onready var Raund = $HBoxContainer/Raund
@onready var dead_panel = $DeadPanel

var score = 0
var raund = 1
var stag_beetle_count = 1
var mole_count = 1
var rat_count = 1
var is_new_raund_start = false
var is_new_game_start = false
var is_dead = false

func _process(delta):
	Score.set_text("Счёт: " + str(score))
	Raund.set_text("Раунд: " + str(raund))
	if stag_beetle_count == 0 and mole_count == 0 and !is_new_raund_start:
		is_new_raund_start = true
		raund += 1

func show_dead_panel():
	is_dead = true
	dead_panel.visible = is_dead

func _on_button_pressed():
	score = 0
	raund = 1
	stag_beetle_count = 1
	mole_count = 1
	rat_count = 1
	is_new_game_start = true
	
	is_dead = false
	dead_panel.visible = is_dead
	get_tree().paused = false
	pass # Replace with function body.
