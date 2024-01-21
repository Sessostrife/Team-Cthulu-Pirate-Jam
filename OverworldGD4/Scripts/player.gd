extends CharacterBody2D


var current_dir = "d"
const speed = 100
@onready var actionable_finder: Area2D = $Direction/ActionableFinder

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0 and global.current_state_player != "menu":
			global.current_state_player = "interacting"
			play_anim(0)
			actionables[0].action()
	if Input.is_action_just_pressed("interact"):
		pass

func _physics_process(delta):
	#var tree = get_tree()
	#var current_scene = tree.get_current_scene()
	#global.active_scene = current_scene.get_name()
		
	#if global.active_scene == "Saloon":
	#	$Camera2D.limit_left = -50
	#	$Camera2D.limit_top = -500
	#	$Camera2D.limit_right = 500
	#	$Camera2D.limit_bottom = 50
	if global.current_state_player == "walking":
		player_movement(delta)
	
func player_movement(delta):
	
	if Input.is_action_pressed("up"):
		$Direction.rotation = 135
		current_dir = "u"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	elif Input.is_action_pressed("down"):
		$Direction.rotation = 0
		current_dir = "d"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("left"):
		$Direction.rotation = 90
		current_dir = "l"
		play_anim(1)
		velocity.y = 0
		velocity.x = -speed
	elif Input.is_action_pressed("right"):
		$Direction.rotation = 180
		current_dir = "r"
		play_anim(1)
		velocity.y = 0
		velocity.x = speed
	else:
		play_anim(0)
		velocity.y = 0
		velocity.x = 0

	move_and_slide()

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "u":
		if movement == 1:
			anim.play("UP_WALKING")
		elif movement == 0:
			anim.play("UP_IDLE")
			
	if dir == "d":
		if movement == 1:
			anim.play("DOWN_WALKING")
		elif movement == 0:
			anim.play("DOWN_IDLE")
			
	if dir == "l":
		anim.flip_h = false
		if movement == 1:
			anim.play("LEFT_WALKING")
		elif movement == 0:
			anim.play("LEFT_IDLE")
			
	if dir == "r":
		#anim.flip_h = true
		if movement == 1:
			anim.play("RIGHT_WALKING")
		elif movement == 0:
			anim.play("RIGHT_IDLE")
