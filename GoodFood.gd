extends KinematicBody2D

var velocity := Vector2.ZERO
var move_direction := Vector2.ZERO
var travel_speed := 150


func set_direction(direction):
	if direction == "down":
		move_direction = Vector2.DOWN * travel_speed
	if direction == "left":
		move_direction = Vector2.LEFT * travel_speed
	if direction == "up":
		move_direction = Vector2.UP * travel_speed
	if direction == "right":
		move_direction = Vector2.RIGHT * travel_speed


func _physics_process(delta):
	velocity += move_direction * delta
	
	velocity = move_and_slide(velocity)
