extends Control

func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Main.tscn")
