extends Node

var world = "rotatinggroup"

func _process(delta):
	ECS.update(world)

func _ready():
	ECS.rebuild()


func _on_Rotate_pressed():
	world = "rotatinggroup"


func _on_Move_pressed():
	world = "movinggroup"
