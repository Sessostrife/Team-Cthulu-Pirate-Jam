extends Control

@export var char_stats : CharacterStats
@onready var options = $VBoxContainer/Options
@onready var quit = $VBoxContainer/Quit
@onready var play = $VBoxContainer/Play
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("Pause"):
		options.release_focus()
	
func _process(_delta):
	pass


func _on_play_pressed():
	global.key_status = "gave"
	global.character = char_stats.create_instance()
	global.cards = load("res://characters/allcards.tres")
	Transit.change_scene_to_file("res://Scenes/world.tscn")
	global.overworld_active = true
	if play.has_focus():
		play.release_focus()
	else:
		play.grab_click_focus()


func _on_options_pressed():
	global.options_menu = true


func _on_quit_pressed():
	get_tree().quit()
