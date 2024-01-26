extends "res://Scripts/Area2D.gd"

func _on_body_entered(body):
	Transit.change_scene_to_file("res://Scenes/salloon3.tscn")
