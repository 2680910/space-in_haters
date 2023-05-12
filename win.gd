extends Node2D


func _ready():
	# Sorts the array
	GlobalVariables.scoringInformation["highScores"].sort()
	
	# Searches the array for the value, or the position in the array where it will "fit".
	var highScorePosition = GlobalVariables.scoringInformation["highScores"].bsearch(GlobalVariables.scoringInformation["currentScore"], true)
	print("position #", highScorePosition)
	
	# Inserts the value into the array at the correct position.
	GlobalVariables.scoringInformation["highScores"].insert(highScorePosition, GlobalVariables.scoringInformation["currentScore"])
	
	# Removes the first (and lowest) score.
	GlobalVariables.scoringInformation["highScores"].remove(0)
	
	# Debugging.
	print(GlobalVariables.scoringInformation["highScores"])
	
func saveData():
	var file = File.new()
	if file.file_exists(GlobalVariables.saveFile):
		var error = file.open(GlobalVariables.saveFile, File.READ)
		if error == OK:
			var player_data = file.get_var()
			file.close()
			GlobalVariables.scoringInformation = player_data

func _on_go_back_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://Menu/Menu.tscn")
