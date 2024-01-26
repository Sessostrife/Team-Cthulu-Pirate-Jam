extends PlayerHandler

var playercard : int = -1
var reward: int = -1
var rewards: Array[Card] = []

func _ready():
	Events.card_played.connect(_on_card_played)
	character = global.character
	character.draw_pile = character.deck.duplicate(true)
	character.draw_pile.shuffle()
	character.discard = CardPile.new()
	draw_deck(10)
	rewards = [reward_card(), reward_card()]
	%Rewardcard1.add_card(rewards[0])
	%Rewardcard2.add_card(rewards[1])
	global.character.max_health +=2
	global.character.heal(2)

func reward_card()->Card:
	return global.cards.choose_random()

func switch_cards()->bool:
	if playercard == -1 or reward == -1:
		return false
	global.character.starting_deck.remove_card(playercard)
	global.character.starting_deck.add_card(rewards[reward])
	return true


func _on_swap_pressed():
	switch_cards()
	Transit.change_scene_to_file("res://Scenes/Battle/Redbattle/Battle.tscn")

func _on_card_0_pressed():
	playercard = 0


func _on_card_1_pressed():
	playercard = 1


func _on_card_2_pressed():
	playercard = 2


func _on_card_3_pressed():
	playercard = 3


func _on_card_4_pressed():
	playercard = 4


func _on_card_5_pressed():
	playercard = 5


func _on_card_6_pressed():
	playercard = 6


func _on_card_7_pressed():
	playercard = 7


func _on_card_8_pressed():
	playercard = 8


func _on_card_9_pressed():
	playercard = 09


func _on_reward_0_pressed():
	reward=0


func _on_reward_1_pressed():
	reward=1
