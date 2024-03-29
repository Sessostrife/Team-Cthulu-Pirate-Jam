class_name PlayerHandler
extends Node

const HAND_DRAW_INTERVAL := .25
const HAND_DISCARD_INTERVAL :=.25

@export var hand: Hand
@export var hand2: Hand2

var hold: bool = false
var character: CharacterStats

func _ready()->void:
	Events.card_played.connect(_on_card_played)
	Events.hold.connect(_change_hold)
	
	
func start_battle(char_stats: CharacterStats)-> void:
	character = char_stats
	character.draw_pile = character.deck.duplicate(true)
	character.draw_pile.shuffle()
	character.discard = CardPile.new()
	start_turn()
	
	
func start_turn()->void:
	if hold:
		hold = false
		print("2")
	else:
		character.block = 0
	character.reset_mana()
	draw_cards(character.cards_per_turn)
	
	
func end_turn()->void:
	hand.disabled_hand()
	discard_cards()
	
	
func draw_many()-> void:
	reshuffle_deck_from_discard()
	hand2.add_card(character.draw_pile.draw_card())
	reshuffle_deck_from_discard()
	
func draw_card()-> void:
	reshuffle_deck_from_discard()
	hand.add_card(character.draw_pile.draw_card())
	reshuffle_deck_from_discard()
	
	
func draw_deck(amount: int)-> void:
	var tween := create_tween()
	for i in range(amount):
		tween.tween_callback(draw_many)
	
	
func draw_cards(amount: int)->void:
	var tween := create_tween()
	for i in range(amount):
		tween.tween_callback(draw_card)
		tween.tween_interval(HAND_DRAW_INTERVAL)
		
	tween.finished.connect(
		func(): Events.player_hand_drawn.emit()
	)



func discard_cards()->void:
	var tween := create_tween()
	for card_ui in hand.get_children():
		tween.tween_callback(character.discard.add_card.bind(card_ui.card))
		tween.tween_callback(hand.discard_card.bind(card_ui))
		tween.tween_interval(HAND_DISCARD_INTERVAL)
		
	tween.finished.connect(
		func():
			Events.player_hand_discarded.emit()
	)
	
	
func reshuffle_deck_from_discard()->void :
	if not character.draw_pile.empty():
		return
	
	while not character.discard.empty():
		character.draw_pile.add_card(character.discard.draw_card())
		
	character.draw_pile.shuffle()


func _on_card_played(card:Card)->void:
	character.discard.add_card(card)

func _on_show_decklist_pressed():
	character = global.character
	character.draw_pile = character.deck.duplicate(true)
	character.discard = CardPile.new()
	draw_deck(10)
	for card in %Hand2.get_children():
		card.disabled = true
	$ShowDecklist.disabled = true

func _change_hold()->void:
	print("?")
	hold = true
