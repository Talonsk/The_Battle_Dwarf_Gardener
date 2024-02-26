extends Control

@onready var Score = $HBoxContainer/Score
@onready var Raund = $HBoxContainer/Raund

var score = 0
var raund = 1

func _process(delta):
	Score.set_text("Счёт: " + str(score))
	Raund.set_text("Раунд: " + str(raund))

