extends Node 

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
	var error = file.open(GlobalVariables.saveFile, file.WRITE)
	if error == OK:
		file.store_var(GlobalVariables.scoringInformation)
		file.close()
		print("!!Data Saved!!")
	else :
		print("!!Data Not Saved!!")
