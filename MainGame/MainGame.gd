extends Control

export(int) var countdownMax
var currentTimer


func _ready():
	currentTimer = countdownMax 
	$HUD/Countdown.text = str(currentTimer) 
	
	while currentTimer > 0:
		yield(get_tree().create_timer(1.0),"timeout")
		$HUD/Countdown.text = str(currentTimer)
		currentTimer = currentTimer -1
		print(currentTimer)
	print("game over")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://LoseScene.tscn")

# warning-ignore:unused_argument
func _process(delta):
	$HUD/CurrentScore.text = str(GlobalVariables.scoringInformation["currentScore"])
	if get_tree().get_nodes_in_group("enemy").size() == 0:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://WinScene.tscn")

