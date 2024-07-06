extends Label

func _process(delta):
	var score : int = GlobalVariable.score
	self.text = str(score)
