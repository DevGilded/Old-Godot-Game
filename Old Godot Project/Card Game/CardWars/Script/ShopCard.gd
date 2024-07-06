extends Node2D

@onready var FirstN = get_node("../../ShopPurchase/CoinsN/FirstN")
@onready var SecondN = get_node("../../ShopPurchase/CoinsN/SecondN")
@onready var Anim = get_node("../../../../../../AnimPlay")
@onready var ReStockB = get_node("../../ShopPurchase/ReStockB/Button")
const CardBase = preload("res://Scene/CardBase.tscn")
const UserHand = preload("res://Script/UserHand.gd")
var CardSel = []
@onready var DeckSize = UserHand.CardList.size()

func _ready():
	Spawn()

func Spawn():
	var NewCard = CardBase.instantiate()
	CardSel = randi() % DeckSize
	NewCard.CardName = UserHand.CardList[CardSel]
	$Card.add_child(NewCard)

#Spawner
func _OnFirstCPointButtonPressed():
	Spawn()
	$Card.visible = true
	get_node("../../ShopCardButton/FirstCPoint/Button").disabled = false
func _OnSecondCPointButtonPressed():
	Spawn()
	$Card.visible = true
func _OnThirdCPointButtonPressed():
	Spawn()
	$Card.visible = true
func _OnFourthCPointButtonPressed():
	Spawn()
	$Card.visible = true

#Button
func _OnFirstBuyCButtonPressed():
	$Card.visible = false
	CoinDeducted()
	get_node("../../ShopCardButton/FirstCPoint/Button").disabled = true
func _OnSecondBuyCButtonPressed():
	$Card.visible = false
	CoinDeducted()
	get_node("../../ShopCardButton/SecondCPoint/Button").disabled = true
func _OnThirdBuyCButtonPressed():
	$Card.visible = false
	CoinDeducted()
	get_node("../../ShopCardButton/ThirdCPoint/Button").disabled = true
func _OnFourthBuyCButtonPressed():
	$Card.visible = false
	CoinDeducted()
	get_node("../../ShopCardButton/FourthCPoint/Button").disabled = true

func CoinDeducted():
	if SecondN.frame <= 0:
		SecondN.frame  = 9
		FirstN.frame -= 1
		Anim.play("CoinDeducted")
	else:
		SecondN.frame -= 1
		Anim.play("CoinDeducted")
		if FirstN.frame <= 0:
			if SecondN.frame <= 0:
				ButtonDisable()
				ReStockB.disabled = true
				Anim.play("CoinDeducted")

func ButtonDisable():
	get_node("../../ShopCardButton/FirstCPoint/Button").disabled = true
	get_node("../../ShopCardButton/SecondCPoint/Button").disabled = true
	get_node("../../ShopCardButton/ThirdCPoint/Button").disabled = true
	get_node("../../ShopCardButton/FourthCPoint/Button").disabled = true
	pass
