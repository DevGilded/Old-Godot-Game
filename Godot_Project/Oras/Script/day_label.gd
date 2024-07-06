extends Control

func EditText(dayNumber : int = 00, weekend := "WEEK", events := "None", holiday := "None"):
	$weekday/Label.text = weekend
	$number/Label.text = str(dayNumber)
	$holiday_event/Label.text = " Holiday: " + holiday + "\n Event: " + events
