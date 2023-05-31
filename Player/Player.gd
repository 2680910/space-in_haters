extends KinematicBody2D

var movement_speed = 500
var bulletSource = preload("res://Bullet/Bullet.tscn")
export (int) var health = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	set_physics_process(true)



# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _process(delta):
	if GlobalVariables.automaticFiring: 
		if Input.is_action_pressed("fire"):
			if GlobalVariables.bulletInstanceCount < 40:
				var bulletInstance = bulletSource.instance()
				bulletInstance.position = Vector2(position.x, position.y-20)
				get_tree().get_root().add_child(bulletInstance)

	elif Input.is_action_pressed("fire"):
		if GlobalVariables.bulletInstanceCount < 5:
			var bulletInstance = bulletSource.instance()
			bulletInstance.position = Vector2(position.x, position.y-20)
			get_tree().get_root().add_child(bulletInstance)

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		if position.x > 10:
			move_and_collide(Vector2(-movement_speed * delta, 0))
	if Input.is_action_pressed("ui_right"):
		if position.x < 1200:
			move_and_collide(Vector2(movement_speed * delta, 0))
	if Input.is_action_pressed("ui_up"):
		move_and_collide(Vector2(0, -movement_speed * delta))
	if Input.is_action_pressed("ui_down"):
		move_and_collide(Vector2(0, movement_speed * delta))
	if Input.is_action_pressed("ui_up"):
		get_tree().change_scene("res://WinScene.tscn")


func reduceHealth():
	health -= 1
	if health == 0:
				get_tree().change_scene("res://Menu/Menu.tscn")
