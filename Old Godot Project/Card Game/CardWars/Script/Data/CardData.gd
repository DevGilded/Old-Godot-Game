enum{HealingCampfire, SwordsMan, BowsMan}

#  [       0,      1,          2,            3,    4,      5,      6]
#  [CardName, IsItem, AttackType, EffectAmount, Cost, Health, Rarity]
# Melee Attack = 0
# Range Attack = 1
# Heal Effect = 1
# Attact Effect = 2

const MeleeT = 4
const RangeT = 5
const AreaT  = 3

const cardData = {
#		[                 0,     1,      2, 3, 4,    5, 6,]
	HealingCampfire :
		["Healing Campfire",  true, AreaT, 1, 1, null, 1],
	SwordsMan       :
		[      "Swords Man", false, MeleeT, 1, 1,    2, 1],
	BowsMan         :
		[        "Bows Man", false, RangeT, 1, 1,    1, 1]
}
