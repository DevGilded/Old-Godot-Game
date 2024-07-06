extends GridContainer

@export var numberSudoku : PackedScene

@export var sudoku : Array[Array] = [
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0]
	]

func _ready():
	randomize()
	
	for i in 81:
		#await get_tree().create_timer(0.1).timeout
		var number = numberSudoku.instantiate()
		number.Number = sudoku[int(i/floor(9))][i%9]
		add_child(number)
	
	for i in 81:
		await get_tree().create_timer(0.1).timeout
		get_child(i)._ChangeNumber(sudoku[int(i/floor(9))][i%9])
	
	print(get_child(1).Number)
