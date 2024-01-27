class_name StunEffect
extends Effect

var amount :=0


func execute(targets: Array[Node])->void:
	for target in targets:
		if not target:
			continue
		if target is Enemy:
			target.take_damage(amount)
			target.stun_me()
