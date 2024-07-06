class_name Calendar
extends Node

var weekdays = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
var months = ["Null","January","February","March","April","May","June","July","August","September","October","November","December",]
var month_length = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

var date = Time.get_datetime_dict_from_system() 
var today = date.get("day")
var weekday = date.get("weekday")
var month = date.get("month")
var year = date.get("year")

func what_week(DateNumber, Month, Century):#(Year Code + Month Code + Century Code + Date Number - Leap Year Code) mod 7
	var Year = Century % 100
	Year = (Year + (Year / 4)) % 7
	Century = Century / 100
	match Month:
		"January": Month = 0
		"February": Month = 3
		"March": Month = 3
		"April": Month = 6
		"May": Month = 1
		"June": Month = 4
		"July": Month = 6
		"August": Month = 2
		"September": Month = 5
		"October": Month = 0
		"November": Month = 3
		"December": Month = 5
		_: print("Invaled Month")
	match Century:
		17: Century = 4
		18: Century = 2
		19: Century = 0
		20: Century = 6
		21: Century = 4
		22: Century = 2
		23: Century = 0
		_: print("Century not available at the moment")
	return weekdays[(Year + Month + Century + DateNumber - leap_year_code()) % 7]

func leap_year_code():
	var is_leap_year : bool = false
	if year % 4 == 0:
		if year % 100 == 0:
			if year % 400 == 0:
				is_leap_year = true  # Divisible by 4, 100, and 400
		else:
			is_leap_year = true  # Divisible by 4 but not by 100
	if is_leap_year:
		if month == "January":
			return 1
		if month == "September":
			return 1
	return 0
