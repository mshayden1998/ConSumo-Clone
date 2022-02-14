extends KinematicBody2D

const speed = 201 #speed in pixels/second

var velocity = Vector2.ZERO
var weight = 100
var lives = 3


func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("player_move_up"):
		velocity.y -= speed
	if Input.is_action_pressed("player_move_down"):
		velocity.y += speed
	if Input.is_action_pressed("player_move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("player_move_right"):
		velocity.x += speed
	# Make sure diagonal movement isn't faster
	velocity = velocity.normalized() * speed


func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)


func _on_ItemsDetection_body_entered(body):
	if body.name == "GoodFood":
		weight += 10
		body.queue_free()
	if body.name == "BadFood":
		weight -= 5
