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
					current_note.destroy(3)
				elif good:
					get_parent().increment_score(2)
					current_note.destroy(2)
				elif okay:
					get_parent().increment_score(1)
					current_note.destroy(1)
				_reset()
			else:
				get_parent().increment_score(0)
		if event.is_action_pressed(input):
			frame = 1
		elif event.is_action_released(input):
			$PushTimer.start()

func _on_PerfectArea_area_entered(area):
	perfect = true

func _on_PerfectArea_area_exited(area):
	perfect = false

func _on_GoodArea_area_entered(area):
	good = true

func _on_GoodArea_area_exited(area):
	good = false


func _on_PushTimer_timeout():
	frame = 0

func _reset():
	current_note = null
	perfect = false
	good = false
	okay = false

	

