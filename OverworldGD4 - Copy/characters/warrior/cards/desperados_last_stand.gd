extends Card


func apply_effects(targets: Array[Node])->void:
	var damage_effect := DamageEffect.new()
	damage_effect.amount = 2
	if global.character.health <= global.character.max_health/4:
		damage_effect.amount = 10
	damage_effect.execute(targets)
