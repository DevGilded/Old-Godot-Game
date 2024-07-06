extends MarginContainer

@onready var CardData = preload("res://Script/Data/CardData.gd")
@export var CardName = "HealingCampfire"
@onready var CardInfo = CardData.cardData[]

@onready var TypeN        = $ImageBar/BottomBar/CardEffect/Type/Sprite2D
@onready var HealthN      = $TextBar/BottomBar/Stats/Health/Sprite2D
@onready var NameN        = $TextBar/BottomBar/Name/Layer/Label
@onready var AttackTypeN  = $ImageBar/BottomBar/CardEffect/Effect/Sprite2D
@onready var StatsN       = $TextBar/BottomBar/Stats/Effect/Sprite2D
@onready var CostN        = $TextBar/Cost/CostAmount/Sprite2D
@onready var RarityN      = $TextBar/Rating/Rarity/Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	CardStats()

func CardStats():
	var Health          = 1
	var Item            = 2
	var NameSpace       = CardInfo[0]
	var IsItem          = CardInfo[1]
	var AttackType      = CardInfo[2]
	var EffectAmount    = CardInfo[3]
	var Cost            = CardInfo[4]
	var CardHealth      = CardInfo[5]
	var Rarity          = CardInfo[6]
	
	if IsItem          == true:
		TypeN.frame     = Item
		HealthN.visible = false
	else:
		TypeN.frame     = Health
		HealthN.frame   = CardHealth
	NameN.text          = NameSpace
	AttackTypeN.frame   = AttackType 
	StatsN.frame        = EffectAmount
	CostN.frame         = Cost
	RarityN.frame       = Rarity
	
