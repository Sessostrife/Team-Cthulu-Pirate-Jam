extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _input(event):
	if event.is_action_pressed("Pause") and global.current_state_player == "walking" and global.overworld_active == true:
		self.show()
		global.current_state_player = "menu"
	elif event.is_action_pressed("Pause") and global.current_state_player == "menu" and global.overworld_active == true:
		global.current_state_player = "walking"
		self.hide()

		
func _process(delta):
	pass


func _on_main_menu_pressed():
	global.overworld_active = false
	global.current_state_player = "walking"
	Transit.change_scene_to_file("res://Scenes/Main_menu.tscn")


func _on_options_pressed():
	pass # Replace with function body.


func _on_resume_pressed():
	global.current_state_player = "walking"
	self.hide()
	

