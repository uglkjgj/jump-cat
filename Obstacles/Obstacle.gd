extends Area2D

var obstacle_list = ["sloth", "family", "pile", "pizza", "couch", "kittens", "maru"]
onready var obstacle_speed = rand_range(490, 550)

func _ready():
	randomize()
	var currenct_obstacle = obstacle_list[randi() % obstacle_list.size()]
	$AnimatedSprite.animation = currenct_obstacle
	
func _process(delta):
	position.x -= obstacle_speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Obstacle_body_entered(body):
	body.end_game()
