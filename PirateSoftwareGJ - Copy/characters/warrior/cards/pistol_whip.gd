extends Card

func apply_effects(targets: Array[Node])->void:
	var stun_effect := StunEffect.new()
	stun_effect.amount = 2
	stun_effect.execute(targets)
	
