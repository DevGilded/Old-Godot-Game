extends Control

enum MonthSize {
	January   = 31
	February  = 28
	March     = 31
	April     = 30
	May       = 31
	June      = 30
	July      = 31
	August    = 31
	September = 30
	October   = 31
	November  = 30
	December  = 31
}
enum Month {
	January   = 4
	February  = 0
	March     = 0
	April     = 3
	May       = 5
	June      = 1
	July      = 3
	August    = 6
	September = 2
	October   = 4
	November  = 0
	December  = 2
}

onready var DayContainer = preload("res://Scene/DayContainer.tscn")

var date = Time.get_date_dict_from_system()
var today = date.get("day")
var month = date.get("month")
var year = date.get("year")
const CalendarSize = 35

func LoadCalendar(MonthInput, MonthSizeInput):
	# Calculate what weekend is the first day in a month by
	# Equation Century + Year + Month + Day
	var FirstMonth = Century(year) + Year(year) + MonthInput + 1
	
	# Load The Calendar
	for i in CalendarSize:
		var n = DayContainer.instance()
		if (i - (FirstMonth - 1)) == today:
			n.IsToday = true
		if FirstMonth == 7 and i < MonthSizeInput:
			n.DayNumber = i + 1
			n.IfDay = true
		elif i <= (FirstMonth - 1):
			pass
		elif (i - (FirstMonth - 1)) <= MonthSizeInput:
			if i == (CalendarSize - 1) and i >= MonthSizeInput:
				var s = i - (FirstMonth - 1)
				$Background/Layer2.rect_size.y += 66
				for j in 7:
					var new = DayContainer.instance()
					print(j + s)
					if (j + s) <= MonthSizeInput:
						if ((j + s) - (FirstMonth - 1)) == today:
							new.IsToday = true
						new.DayNumber = j + s
						new.IfDay = true
					$DayGrid.add_child(new)
			else:
				n.DayNumber = i - (FirstMonth - 1)
				n.IfDay = true
		$DayGrid.add_child(n)

func _ready():
	# To make sure the month number is in two digit
	if month <= 9:
		$Month/MonthNumber/Label.text = "0" + str(month)
	else:
		$Month/MonthNumber/Label.text = str(month)
	
	$Month/Year/Label.text = str(year)
	
	match month:
		# January
		1:
			LoadCalendar(Month.January, MonthSize.January)
			$Month/MonthName/Label.text = "January"
		# February
		2:
			LoadCalendar(Month.February, MonthSize.February)
			$Month/MonthName/Label.text = "February"
		# March
		3:
			LoadCalendar(Month.March, MonthSize.March)
			$Month/MonthName/Label.text = "March"
		# April
		4:
			LoadCalendar(Month.April, MonthSize.April)
			$Month/MonthName/Label.text = "April"
		# May
		5:
			LoadCalendar(Month.May, MonthSize.May)
			$Month/MonthName/Label.text = "May"
		# June
		6:
			LoadCalendar(Month.June, MonthSize.June)
			$Month/MonthName/Label.text = "June"
		# July
		7:
			LoadCalendar(Month.July, MonthSize.July)
			$Month/MonthName/Label.text = "July"
		# August
		8:
			LoadCalendar(Month.August, MonthSize.August)
			$Month/MonthName/Label.text = "August"
		# September
		9:
			LoadCalendar(Month.September, MonthSize.September)
			$Month/MonthName/Label.text = "September"
		# October
		10:
			LoadCalendar(Month.October, MonthSize.October)
			$Month/MonthName/Label.text = "October"
		# November
		11:
			LoadCalendar(Month.November, MonthSize.November)
			$Month/MonthName/Label.text = "November"
		# December
		12:
			LoadCalendar(Month.December, MonthSize.December)
			$Month/MonthName/Label.text = "December"

func Century(Year : int):
	var Century = int(str(Year).left(2))
	match Century:
		16,20,24:
			Century = 2
		17,21,25:
			Century = 0
		18,22,26:
			Century = 5
		19,23,27:
			Century = 3
		_:
			print("Fail")
	return Century

func Year(Year : int):
	var Y = int(str(Year).right(2))
	var C : float = round(Y / 4)
	Y = int(Y + C) % 7
	return Y


func _on_TextureButton_button_down():
	self.visible = true


func _on_TextureButton_button_up():
	self.visible = false
