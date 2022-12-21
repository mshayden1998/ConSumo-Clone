extends Node

var window_size = OS.window_size


func _ready():
	pass


func _input(event):
	if event.is_action_pressed("main_pause"):
		$PauseMenu.visible = true


func _on_Timer_timeout():
	pass


func _on_StartBtn_pressed():
	pass
