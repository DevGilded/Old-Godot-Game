extends Node

@export var Header: Label
@export var calendar_grid: GridContainer

var calendar_months = {
	1: 'January',
	2: 'February',
	3: 'March',
	4: 'April',
	5: 'May',
	6: 'June',
	7: 'July',
	8: 'August',
	9: 'September',
	10: 'October',
	11: 'November',
	12: 'December'
}

class what_in_calendar:
	var months = {
		'January': 4,
		'February': 0,
		'March': 0,
		'April': 3,
		'May': 5,
		'June': 1,
		'July': 3,
		'August': 6,
		'September': 2,
		'October': 4,
		'November': 0,
		'December': 2
	}

	var century = {
		0: 2,
		1: 0,
		2: 5,
		3: 3
	}
	
	var weekends = [
		'Sunday',
		'Monday',
		'Tuesday',
		'Wednesday',
		'Thursday',
		'Friday',
		'Saturday',
	]
	
	func days_in_month(month: String, is_leap: bool):
		var days = {
			'January': 31,
			'February': 28 + (1 if is_leap else 0),
			'March': 31,
			'April': 30,
			'May': 31,
			'June': 30,
			'July': 31,
			'August': 31,
			'September': 30,
			'October': 31,
			'November': 30,
			'December': 31
		}
		return days[month]
	
	func week(month: String, day: int, year: int) -> int:
		var century_value = century[int(str(year)[0] + str(year)[1]) % 4]
		var month_value = months[month]
		var day_value = day % 7
		var year_value = (year + (year / 4)) % 7
		var is_leap_year = 1 if int(str(year)[0] + str(year)[1]) % 4 == 0 else 0
		var result = ((int(century_value) + int(year_value) + int(month_value) + int(day_value)) % 7) - is_leap_year
		return result


var old_date = Time.get_datetime_dict_from_datetime_string('month', true)
var current_date = Time.get_datetime_dict_from_system()

func _ready():
	var what = what_in_calendar.new()
	var month = calendar_months[current_date.month]
	var day = current_date.day
	var year = current_date.year
	
	var is_leap_year = true if int(str(year)[0] + str(year)[1]) % 4 == 0 else false
	
	var current_label = 0
	
	# old month
	var month_days = what.days_in_month(calendar_months[current_date.month - 1], is_leap_year)
	var day_offset = what.week(calendar_months[current_date.month - 1], month_days, year)
	while true:
		calendar_grid.get_child(current_label).get_child(1).text = str(month_days - day_offset)
		current_label += 1
		if month_days - day_offset == month_days:
			break
		day_offset -= 1
	
	# current month
	month_days = what.days_in_month(calendar_months[current_date.month - 0], is_leap_year)
	day_offset = month_days - 1
	while true:
		calendar_grid.get_child(current_label).get_child(1).text = str(month_days - day_offset)
		calendar_grid.get_child(current_label).get_child(1).add_theme_color_override('font_color', Color(1,1,1))
		current_label += 1
		if month_days - day_offset == month_days:
			break
		day_offset -= 1
	
	# next month
	month_days = 1
	while true:
		calendar_grid.get_child(current_label).get_child(1).text = str(month_days)
		if current_label == 41:
			break
		month_days += 1
		current_label += 1
	
	Header.text = str(day) + ' ' + month + ' ' + str(year) + ' '
