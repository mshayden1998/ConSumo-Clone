extends Control


func _input(event):
	if event.is_action_pressed("main_pause"):
		visible = false

func _on_ResumeBtn_pressed():
	visible = false


func _on_ExitBtn_pressed():
	get_tree().quit()
