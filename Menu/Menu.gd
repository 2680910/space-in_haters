extends Node



func _ready():
	for button in $"Layout/Main/Buttons/GameScenes".get_children():
		button.connect("pressed", self, "_on_Button_Pressed", [button.scene_to_load])
		
	var file = File.new()
	if file.file_exists(GlobalVariables.saveFile):
		var error = file.open(GlobalVariables.saveFile, File.READ)
		if error == OK:
			var player_data = file.get_var()
			file.close()
			GlobalVariables.scoringInformation = player_data

