extends Control

func _process(_delta):
	var time = Time.get_datetime_dict_from_system()
	var hour = time.get("hour")
	var minute = time.get("minute")
	var day = "AM"
	if str(minute).length() == 1:
		minute = "0" + str(minute)
	if hour >= 12:
		hour -= 12
		day = "PM"
	$Label.text = str(hour) + ":" + str(minute) + " " + day
