extends Node

export(float) var StarPlatForm
export(float) var StarGenre
export(float) var StarStyle
export(bool) var IsPlatForm
export(bool) var IsGenre
export(bool) var IsStyle
export(bool) var IsRandom
export(String) var IfGenre
export(String) var IfStyle
export(Array, String) var IfRandomGenre
export(Array, String) var IfRandomStyle

onready var NodeName = self.name

func CheckReward() -> void:
	if NodeName == "Reward":
		if IsGenre == true and IfRandomGenre.size() >= 7:
			IfRandomGenre = Rando(IfRandomGenre, 7)
			StarGenre = SportValue(IfRandomGenre, 4, 4, 2.5, 3, 3, 2.5, 3.5)
			print(str(IfRandomGenre) + " = " + str(StarGenre))

func SportValue(Star, S : float, BtB : float, T : float, VB : float, BB : float, IH : float, G : float):
	match Star:
		"Soccer":
			Star = S
		"BasketBall":
			Star = BtB
		"Tennis":
			Star = T
		"VolleyBall":
			Star = VB
		"BaseBall":
			Star = BB
		"IceHockey":
			Star = IH
		"Golf":
			Star = G
	return Star

func CheckRandomBook() -> void:
	if NodeName == "RandomBook" or NodeName == "RandomBook2":
		if IsGenre == true and IfRandomGenre.size() >= 5:
			IfRandomGenre = Rando(IfRandomGenre, 5)
			StarGenre = BooksValue(IfRandomGenre, 4, 1.5, 1.5, 0.5, 2)
			print(str(IfRandomGenre) + " = " + str(StarGenre))
		if IsStyle == true and IfRandomStyle.size() >= 5:
			IfRandomStyle = Rando(IfRandomStyle, 5)
			StarGenre = BooksValue(IfRandomStyle, 3.5, 2.5, 0.5, 0.5, 2.5)
			print(str(IfRandomStyle) + " = " + str(StarGenre))

func Rando(Change, Amount : int):
	randomize()
	var i = randi() % Amount
	Change = Change[i]
	return Change
func BooksValue(Star, F : float, H : float, NS : float, LB : float, DB : float):
	match Star:
		"Fantasy":
			Star = F
		"History":
			Star = H
		"NovelStory":
			Star = NS
		"LearningBook":
			Star = LB
		"DrawingBook":
			Star = DB
	return Star


func _ready() -> void:
	if IsRandom:
		CheckRandomBook()
		CheckReward()
	if IsGenre:
		if !IsRandom and IsGenre:
			print(IfGenre + " = " + str(StarGenre))
