extends AnimatedSprite2D
var perfect = false
var good = false
var okay = false
var current_note = null

@export var input = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# with credit to https://www.youtube.com/watch?v=_FRiPPbJsFQ
func _unhandled_input(event):
	if event.is_action(input):
		if event.is_action_pressed(input, false):
			if current_note != null:
				if perfect:
					get_parent().increment_score(3)
					print("perfect, " , current_note)
					current_note.hit()
				elif good:
					get_parent().increment_score(2)
					print("good, " , current_note)
					current_note.hit()
				elif okay:
					get_parent().increment_score(1)
					current_note.hit()
				_reset()
			else:
				get_parent().increment_score(0)
		if event.is_action_pressed(input):
			frame = 1
		elif event.is_action_released(input):
			frame = 0

func _on_PerfectArea_area_entered(area):
	perfect = true
	print("hello")
	current_note = area

func _on_PerfectArea_area_exited(area):
	perfect = false
	print("byebye")
	current_note = null

func _on_GoodArea_area_entered(area):
	good = true
	print("hihi")
	current_note = area

func _on_GoodArea_area_exited(area):
	good = false
	print("byeeeee")
	current_note = null

func _on_PushTimer_timeout():
	frame = 0

func _reset():
	current_note = null
	perfect = false
	good = false
	okay = false

	



func _on_perfect_area_area_entered(area):
	pass # Replace with function body.
