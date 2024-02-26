extends CanvasLayer
@onready var TitrePanel = $Menu/TitrePanel

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_play_pressed():
	if !TitrePanel.visible:
		get_tree().change_scene_to_file("res://Scene/main.tscn")

func _on_setting_pressed():
	if !TitrePanel.visible:
		TitrePanel.visible = true
	
func _on_button_pressed():
	TitrePanel.visible = false

func _on_quit_pressed():
	if !TitrePanel.visible:
		get_tree().quit()


