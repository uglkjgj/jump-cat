extends Node

const OBSTACLE = preload("res://Obstacles/Obstacle.tscn")
const BACKGROUND = preload("res://Details/Background.tscn")
const FOREGROUND = preload("res://Details/Foreground.tscn")

func _ready():
	Global.current_score = 0
	
func _on_Timer_timeout():
	var obstacle = OBSTACLE.instance()
	add_child(obstacle)
	$Timer.wait_time = rand_range(1, 3)

func _on_ScoreTimer_timeout():
	Global.current_score += 1
	
func _process(delta):
	$Score.text = "Score: " + str(Global.current_score)


func _on_ForegroundTimer_timeout():
	var detail = FOREGROUND.instance()
	add_child(detail)
	detail.position = $ForegroundStartPos.get_children()[randi() % $ForegroundStartPos.get_child_count()].position

func _on_BackgroundTimer_timeout():
	var detail = BACKGROUND.instance()
	add_child(detail)
	detail.position = $BackgroundStartPos.get_children()[randi() % $BackgroundStartPos.get_child_count()].position
