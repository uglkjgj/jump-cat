extends AnimatedSprite

var details_list = ["balloon1", "balloon2", "broom"]

func _ready():
	animation = details_list[randi() % details_list.size()]
	var scaling = rand_range(0.2, 0.4)
	scale.x = scaling
	scale.y = scaling
	
func _process(delta):
	position.x -= 300 * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
