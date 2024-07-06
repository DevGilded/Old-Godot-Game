extends Control

var calendar = Calendar.new()

func button_text():
	match get_parent().name:
		"MONTH":
			return [" << Year", "Week >> "]
		"WEEK":
			return [" << Month", "Day >> "]
		"YEAR":
			return [" << Option", "Month >> "]
		"DAY":
			return [" << Week", "Add Event >> "]
		_:
			return [" << Misused Scene", "Misused Scene >> "]

func _ready():
	$header/Label.text = "MODE : DAY \n" + calendar.months[calendar.month] + " " + str(calendar.year)
	$buttons/Back.text = button_text()[0]
	$buttons/Next.text = button_text()[1]
