extends Node2D

var grid_size = 9
var grid = []

func _ready():
	randomize()
	generate_sudoku()
	print_sudoku()
	drawSudoku()

func generate_sudoku():
	# Initialize an empty grid
	for i in range(grid_size):
		var row = []
		for j in range(grid_size):
			row.append(0)
		grid.append(row)

	# Fill the grid with a valid Sudoku puzzle
	if solve_sudoku(0, 0):
		print("Sudoku puzzle generated successfully!")
	else:
		print("Failed to generate Sudoku puzzle.")

func solve_sudoku(row, col):
	if row == grid_size - 1 and col == grid_size:
		return true

	if col == grid_size:
		row += 1
		col = 0

	if grid[row][col] != 0:
		return solve_sudoku(row, col + 1)

	for num in range(1, grid_size + 1):
		if is_valid_move(row, col, num):
			grid[row][col] = num
			if solve_sudoku(row, col + 1):
				return true
			grid[row][col] = 0

	return false

func is_valid_move(row, col, num):
	return (
		not used_in_row(row, num) and
		not used_in_column(col, num) and
		not used_in_box(row - row % 3, col - col % 3, num)
	)

func used_in_row(row, num):
	return num in grid[row]

func used_in_column(col, num):
	for i in range(grid_size):
		if grid[i][col] == num:
			return true
	return false

func used_in_box(box_start_row, box_start_col, num):
	for i in range(3):
		for j in range(3):
			if grid[i + box_start_row][j + box_start_col] == num:
				return true
	return false

func print_sudoku():
	for row in grid:
		print(row)

func drawSudoku():
	var Parent = $SudokuLayout/ROW
	for ROW in 9:
		for COLUMN in 9:
			Parent.get_child(ROW).get_child(COLUMN).text = str(grid[COLUMN][ROW])
