extends Control

@export var SudokuNumbers : Array = [1,2,3,4,5,6,7,8,9]

func _ready() -> void:
#	SudokuNumbers.shuffle()
#	print(SudokuNumbers)
	var blockSize = 3
	var numberParent = $Numbers
	for y in blockSize:
		var numberChild = numberParent.get_child(y)
		for x in blockSize:
			var numberGrandChild = numberChild.get_child(x)
			numberGrandChild.text = str(SudokuNumbers.front())
			SudokuNumbers.pop_front()
