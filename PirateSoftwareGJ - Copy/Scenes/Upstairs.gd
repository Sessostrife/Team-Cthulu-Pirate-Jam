extends "res://Scenes/Saloontransfer.gd"


func _on_body_entered(body):
	Transit.change_scene_to_file("res://Scenes/Battle_Area_Main2.tscn")
