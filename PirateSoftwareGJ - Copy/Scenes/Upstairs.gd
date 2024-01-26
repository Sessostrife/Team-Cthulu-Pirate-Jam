extends "res://Scenes/Saloontransfer.gd"


func _on_body_entered(body):
	Transit.change_scene_to_file("res://Scenes/World2.tscn")
