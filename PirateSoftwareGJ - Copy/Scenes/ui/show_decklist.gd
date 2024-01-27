extends Button

func on_button_press()-> void:
	Events.show_full_deck.emit()
