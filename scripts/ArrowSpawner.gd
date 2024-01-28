extends Node2D

var arrow_path = preload("res://scenes/ArrowNote.tscn")

# Called when the node enters the scene tree for the first time
var wait_times = [2,3,4,5,6]
func _ready():
	#$Timer.wait_time = wait_times[randi() % 4]
	#print($Timer.wait_time)
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var arrow = arrow_path.instantiate()
	arrow.position = Vector2(500,1080)
	self.add_child(arrow)
	$Timer.wait_time = wait_times[randi() % 4]
	print($Timer.wait_time)
	$Timer.start()
