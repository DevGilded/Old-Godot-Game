extends MarginContainer

@onready var MainScript = get_parent()
@onready var Anim = $AnimPlay
@onready var CoinDeductedAnim = $VBar/ShopPHBar/VBoxContainer/HBoxContainer/ShopPurchase/CoinsN/CoinDeducted
@onready var ShopTxt = $VBar/ShopPHBar/VBoxContainer/HBoxContainer/ShopButton/ShopN/Label
@onready var FirstN = $VBar/ShopPHBar/VBoxContainer/HBoxContainer/ShopPurchase/CoinsN/FirstN
@onready var SecondN = $VBar/ShopPHBar/VBoxContainer/HBoxContainer/ShopPurchase/CoinsN/SecondN
@onready var ReStockB = $VBar/ShopPHBar/VBoxContainer/HBoxContainer/ShopPurchase/ReStockB/Button
const Spawner = preload("res://Script/ShopCard.gd")

var MaxCoin = false

func _ready():
	MaxCoin = false
	FirstN.frame = MainScript.FirstN
	SecondN.frame = MainScript.SecondN
	CoinDeductedAnim.visible = false

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		if MaxCoin == false:
			if SecondN.frame >= 9:
				ReStockB.disabled = false
				FirstN.frame += 1
				SecondN.frame = 0
				Anim.play_backwards("CoinDeducted")
			else:
				ReStockB.disabled = false
				SecondN.frame += 1
				Anim.play_backwards("CoinDeducted")
				if FirstN.frame >= 9:
					if SecondN.frame >= 9:
						MaxCoin = true
	pass

func _OnButtonToggle(T):
	if(T):
		Anim.play("Opening")
		ShopTxt.text = "C\nL\nO\nS\nE"
		ShopTxt.get_font("font").size = 29
		ShopTxt.get_font("font").spacing_top = 2
	else:
		Anim.play("Closing")
		ShopTxt.text = "S\nH\nO\nP"
		ShopTxt.get_font("font").size = 34
		ShopTxt.get_font("font").spacing_top = 1

func _OnReStockButtonPressed():
	CoinDeducted()

func CoinDeducted():
	if SecondN.frame <= 0:
		SecondN.frame  = 9
		FirstN.frame -= 1
		Anim.play("CoinDeducted")
	else:
		MaxCoin = false
		SecondN.frame -= 1
		Anim.play("CoinDeducted")
		if FirstN.frame <= 0:
			if SecondN.frame <= 0:
				ReStockB.disabled = true
				Anim.play("CoinDeducted")
	
