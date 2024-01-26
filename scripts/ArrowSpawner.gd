extends Marker2D
var arrowNote = preload("res://scenes/ArrowNote.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var arrowInstance = arrowNote.instantiate()
# same scene, so can refer to SpawnPositioner's position
	arrowInstance.position = $SpawnPositioner.position
	add_child(arrowInstance)
