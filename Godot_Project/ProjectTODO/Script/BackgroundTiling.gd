extends TileMap

var currentCellv = get_used_cells(0).front() + Vector2i.UP

var blankTexture = 0
var usedCell = 0
var unUsedCell = -1

var up = Vector2i.UP
var down = Vector2i.DOWN
var left = Vector2i.LEFT
var right = Vector2i.RIGHT

var cells = get_used_cells(0)
var weight = cells.back()[0] - (cells.front()[0] - 2)
var height = cells.back()[1] - (cells.front()[1] - 2)

func _ready():
	blankBackground(pixelAmount(Vector2i(weight,height),3))

func blankBackground(loadingTime := 1, loading := true):
	while loading:
		set_cell(0, currentCellv, blankTexture)
		currentCellv = checkNeibourCellv(currentCellv)
		#yield(get_tree(),"idle_frame")
		
		loadingTime -= 1
		if loadingTime == 0:
			loading = false

func pixelAmount(size : Vector2i, thickness := 1):
	var currentSize = size
	var pixel : int
	for i in range(thickness):
		var amount = ((currentSize[0] + currentSize[1]) * 2) + (i * 4)
		pixel += amount
		currentSize += Vector2i.ONE
	return pixel

func neibour(cellv : Vector2i, neibour : Vector2i, nextcell : Vector2i):
	if get_cell_alternative_tile(0, cellv + neibour) >= usedCell:
		if get_cell_alternative_tile(0, cellv + nextcell) == unUsedCell:
			return true
	return false

func checkNeibourCellv(cellv : Vector2i):
	if neibour(cellv, down, right):
		return cellv + right
	if neibour(cellv, left, down):
		return cellv + down
	if neibour(cellv, up, left):
		return cellv + left
	if neibour(cellv, right, up):
		return cellv + up
	return cellv
