extends KinematicBody2D

const GRAVITY = 10
const JUMP_SPEED = -400
var velocity = Vector2.ZERO # Vector2 holds an x and y value with this we can get a direction which is what we need

func _process(delta):
	velocity.y += GRAVITY
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_SPEED
		$AudioStreamPlayer.play()
	
	if is_on_floor():
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("jump")
		
	move_and_slide(velocity, Vector2.UP)

func end_game():
	get_tree().change_scene("res://TitleScreen/Title Screen.tscn")
