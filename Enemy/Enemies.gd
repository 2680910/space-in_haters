extends Node2D

var speed = -200

func _ready():
	set_physics_process(true)
	
	
func _physics_process(delta):
	global_position.x += speed * delta
