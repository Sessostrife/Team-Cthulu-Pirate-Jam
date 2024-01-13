extends AnimatedSprite

var current_animation = "Idle"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	play("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("up"):
		if current_animation != "Up":
			current_animation = "Up"
			play("Up")
	if Input.is_action_pressed("down"):
		if current_animation != "Down":
			current_animation = "Down"
			play("Down")
	if Input.is_action_pressed("left"):
		if current_animation != "Left":
			current_animation = "Left"
			play("Left")
			scale.x = 1
	if Input.is_action_pressed("right"):
		if current_animation != "Right":
			current_animation = "Right"
			play("Right")
			scale.x = -1
	#else:
	#		play("Idle")
#	pass
