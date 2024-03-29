extends Area2D

@export var speed = 600
var HUDNode
var Animator

# Called when the node enters the scene tree for the first time.
func _ready():
# the HUD may not exist before the arrows instantiate, so you can't call it outside of _ready()
	HUDNode = get_node("/root/Game/HUD")
	Animator = get_node("/root/Game/AnimationPlayer_Karen")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2.UP * speed * delta #Moves pipe to the up at a constant speed
#	crudest way to do it: check if position
	if (position.y < 0):
# destroying 
		queue_free()
	pass
	
func hit(action):
	$AnimatedSprite2D.visible = false
	Animator.play("RESET")
	Animator.play(action)
	

