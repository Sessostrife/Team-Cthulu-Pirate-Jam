extends Sprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.apple_status == "has" or global.apple_status == "gave":
		hide()
