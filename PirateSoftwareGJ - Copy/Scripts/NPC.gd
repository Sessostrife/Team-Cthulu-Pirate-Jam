extends CharacterBody2D

func _physics_process(_delta):
	$AnimatedSprite2D.play("IDLE")
	
