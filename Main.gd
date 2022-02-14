extends Node

export (PackedScene) var Player = preload("res://Player.tscn")
export (PackedScene) var GoodFood = preload("res://GoodFood.tscn")
export (PackedScene) var BadFood = preload("res://BadFood.tscn")
export (PackedScene) var InGameUI = preload("res://user_interface/InGame.tscn")
var window_size = OS.window_size

onready var path_group = [
	$BottomPath,
	$LeftPath,
	$RightPath,
	$TopPath
]


func _ready():
	$PauseMenu.visible = false
	$Instructions.visible = true
	
	var p = Player.instance()
	p.transform.origin = Vector2(window_size.x / 2, window_size.y / 2)
	add_child(p)
	
#	var local = Translation.new()
#	local.locale = "pt_BR"


func _input(event):
	if event.is_action_pressed("main_pause"):
		$PauseMenu.visible = true


func _on_Timer_timeout():
	var current_path = path_group[rand_range(0, 4)]
	var current_path_follow = current_path.get_child(0)
	current_path_follow.unit_offset = randf()
	var gf = GoodFood.instance()
	gf.global_position = current_path_follow.position
	if current_path.name == "TopPath":
		gf.set_direction("down")
	elif current_path.name == "RightPath":
		gf.set_direction("left")
	elif current_path.name == "BottomPath":
		gf.set_direction("up")
	elif current_path.name == "LeftPath":
		gf.set_direction("right")
	add_child(gf)


func _on_StartBtn_pressed():
	$Instructions.queue_free()
	var in_game = InGameUI.instance()
	add_child(in_game)
