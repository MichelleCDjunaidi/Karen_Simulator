extends Node2D
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func increment_score(by):
	score += by
#HUD is a child of Game, so use this convention instead of the other one
	$HUD.updateText(score)
	print(score)
# ------------- placeholder: to change state of worker along with score -----------------------
	if score < 5:
		$Worker_Parent/Worker.frame = 0
	elif score < 10:
		$Worker_Parent/Worker.frame = 1
	elif score < 20:
		$Worker_Parent/Worker.frame = 2
	elif score < 30:
		$Worker_Parent/Worker.frame = 3
		$AnimationPlayer_Worker.play("GhostFloaty")
	else:
		game_end()
		$HUD.gameOver(score)
		
func game_end():
	$AudioPlayer_Win.play()
	$AnimationPlayer_Endgame.play("GameEnd")	

		
