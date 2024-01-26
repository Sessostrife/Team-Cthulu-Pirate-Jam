extends EnemyAction

func is_performable()->bool:
	if not enemy:
		return false
	
	if enemy.stats.stun:
		return true
	return false
	
	
func perform_action()->void:
	if not enemy or not target:
		return
	enemy.stats.stun = false
	get_tree().create_timer(.6, false).timeout.connect(
		func():
			Events.enemy_action_completed.emit(enemy)
	)
