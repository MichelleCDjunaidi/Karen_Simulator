extends AnimatedSprite2D
@export var speed = 150
var HUDNode

# Called when the node enters the scene tree for the first time.
func _ready():
# the HUD may not exist before the arrows instantiate, so you can't call it outside of _ready()
	HUDNode = get_node("/root/Game/HUD")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2.UP * speed * delta #Moves pipe to the up at a constant speed
#	crudest way to do it: check if position
	if (position.y < -1500):
# destroying 
		queue_free()
	pass

func _on_GoodArea_area_entered(area):
	HUDNode.incrementScore(1)
