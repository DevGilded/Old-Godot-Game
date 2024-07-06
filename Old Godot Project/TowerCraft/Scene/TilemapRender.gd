extends TileMap

var IslandTilemap : TileSet = preload("res://Misc/Tilemap/IslandTilemap.tres")

var ChunkPosition : Vector2 = Vector2(0,0)
var ChunkSize : int = 16
var IsChunkLoading : bool = false

func _ready() -> void:
	LoadChunk(IslandTilemap, ChunkPosition)

func LoadChunk(Tile_Set : TileSet, _chunkPosition : Vector2) -> void:
	IsChunkLoading = true
	self.tile_set = Tile_Set
	self.cell_size = Vector2(16,16)
	for y in ChunkSize:
		for x in ChunkSize:
			var Vectorposition : Vector2 = Vector2((ChunkPosition[0] * ChunkSize) + x,(ChunkPosition[1] * ChunkSize) + y)
			self.Tileplacement(Vectorposition)
			self.update_bitmask_area(Vectorposition)
	IsChunkLoading = false

func Tileplacement(Cell_Position : Vector2) -> void:
	.set_cellv(Cell_Position, 0, false, false, false, Vector2(3,3))
