extends Control

@onready var Score = $HBoxContainer/Score
@onready var Raund = $HBoxContainer/Raund

var score = 0
var raund = 1
var stag_beetle_count = 1
var mole_count = 1
var rat_count = 1
var is_new_raund_start = false

func _process(delta):
	Score.set_text("Счёт: " + str(score))
	Raund.set_text("Раунд: " + str(raund))
	if stag_beetle_count == 0 and mole_count == 0 and !is_new_raund_start:
		is_new_raund_start = true
		raund += 1

