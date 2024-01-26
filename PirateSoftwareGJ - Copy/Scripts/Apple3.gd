extends Sprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if global.key_status == "has" or global.key_status == "gave":
		hide()
