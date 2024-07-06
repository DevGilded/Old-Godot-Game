extends Control
#
#var months = ["Null","January","February","March","April","May","June","July","August","September","October","November","December",]
#
##Jan:31,Feb:28|29,Mar:31,Apr:30,May:31,June:30,July:31,Aug:31,Sep:30,Oct:31,Nov:30,Dec:31
#var month_length = [31, 28 + leap_year_code(), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
#
#var date = Time.get_date_dict_from_system()
#var today = date.get("day")
#var month = months[date.get("month")]
#var year = date.get("year")

var calendar = Calendar.new()

var current_day = calendar.today
var current_year = calendar.year
var current_month = calendar.months[calendar.month]
var weekday = calendar.what_week(current_day, current_month, current_year)

func _ready():
	Today(current_day, weekday)
	otherDate(current_day)

func Today(today : int, Weekday : String):
	$today/number/Label.text = str(today)
	$today/weekday/Label.text = Weekday

func otherDate(day : int):
	var offset = -2
	for i in get_child(name=="other_date").get_child_count():
		get_child(name=="other_date").get_child(i).EditText(day + offset, calendar.what_week(day + offset, current_month, current_year))
		if offset == -1:
			offset = 1
		else:
			offset += 1
