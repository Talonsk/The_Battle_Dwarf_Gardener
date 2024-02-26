extends CanvasLayer
@onready var SettingPanel = $Menu/SettingPanel

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_play_pressed():
	if !SettingPanel.visible:
		get_tree().change_scene_to_file("res://Scene/main.tscn")

func _on_setting_pressed():
	if !SettingPanel.visible:
		SettingPanel.visible = true
	
func _on_button_pressed():
	SettingPanel.visible = false

func _on_quit_pressed():
	if !SettingPanel.visible:
		get_tree().quit()


