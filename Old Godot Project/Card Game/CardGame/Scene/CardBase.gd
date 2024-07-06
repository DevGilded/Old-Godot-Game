extends MarginContainer

var Cost = 9
var Effect   = 3
var Rarity   = 2

func _ready():
	$Bars/Before/Rating/Rarity.frame = Rarity
	$Bars/TopBar/Cost/Cost.frame = Cost
	$Bars/BottomBar/Effect/EffectAmount.frame = Effect
