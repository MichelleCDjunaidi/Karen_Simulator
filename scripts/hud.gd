extends CanvasLayer
var score = 0 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func incrementScore(num):
	score += num
	$Label.text = "Score: " + str(score)

func gameOver():
	$Label.visible = false
	$Label2.visible = true
	$Label2.text = "You got kicked out! Final score: " + str(score)
	$Button.visible = true


func _on_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	
