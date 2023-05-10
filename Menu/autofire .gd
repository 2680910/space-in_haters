extends CheckButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.












func _on_autofire__pressed():
	GlobalVariables.automaticFiring = pressed 
	print(pressed)
