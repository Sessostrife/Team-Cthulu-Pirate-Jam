extends EnemyAction

@export var block :=15
@export var damage :=5
@export var hp_threshold :=6

var already_used :=false


func is_performable()->bool:
	if not enemy or already_used:
		return false
		
	var is_low := enemy.stats.health <= hp_threshold
	already_used = is_low
	
	return is_low
	
	
func perform_action()->void:
	if not enemy or not target:
		return
		
	var block_effect := BlockEffect.new()
	block_effect.amount = block
	block_effect.execute([enemy])
	
	var tween := create_tween().set_trans(Tween.TRANS_QUINT)
	var start := enemy.global_position
	var end := target.global_position + Vector2.RIGHT * 32
	var damage_effect := DamageEffect.new()
	var target_array: Array[Node] = [target]
	damage_effect.amount = damage
	
	tween.tween_property(enemy, "global_position", end , 0.4)
	tween.tween_callback(damage_effect.execute.bind(target_array))
	tween.tween_interval(.25)
	tween.tween_property(enemy, "global_position", start, 0.4)

	get_tree().create_timer(.6, false).timeout.connect(
		func():
			Events.enemy_action_completed.emit(enemy)
	)
