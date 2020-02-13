extends Node

func _process(delta):
	ECS.update()

func _ready():
	ECS.rebuild()
