extends Node2D

var arrow_path
var arrow_path_up = preload("res://scenes/ArrowNoteUp.tscn")
var arrow_path_left = preload("res://scenes/ArrowNoteLeft.tscn")
var arrow_path_right = preload("res://scenes/ArrowNoteRight.tscn")
var arrow_path_down = preload("res://scenes/ArrowNoteDown.tscn")
var dir

# Called when the node enters the scene tree for the first time
var wait_times = [2,3,4,5,6]
var x_coor_positions = [300, 500, 700, 900]
func _ready():
	#$Timer.wait_time = wait_times[randi() % 4]
	#print($Timer.wait_time)
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	dir = randi() % 4
	if dir == 0 :
		arrow_path = arrow_path_left
	elif dir == 1 :
		arrow_path = arrow_path_up
	elif dir == 2 :
		arrow_path = arrow_path_down
	elif dir == 3 :
		arrow_path = arrow_path_right
	var arrow = arrow_path.instantiate()
	arrow.position = Vector2(x_coor_positions[dir],1080)
	self.add_child(arrow)
	$Timer.wait_time = wait_times[randi() % 4]/3
	print($Timer.wait_time)
	$Timer.start()
