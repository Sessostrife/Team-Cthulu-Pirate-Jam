extends KinematicBody2D


var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2()
export var speed = 0

func key_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		direction = Vector2(0, -1)
	if Input.is_action_pressed("down"):
		velocity.y += 1
		direction = Vector2(0, 1)
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		direction = Vector2(-1, 0)
	if Input.is_action_pressed("right"):
		velocity.x += 1
		direction = Vector2(1, 0)
	
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * speed)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	key_input()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
