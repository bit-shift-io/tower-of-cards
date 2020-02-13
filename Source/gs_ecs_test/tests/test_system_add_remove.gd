extends Node

onready var RotatingSystem = preload("res://gs_ecs_test/systems/test_rotating_system.gd")

func _process(delta):
	ECS.update()


func _on_Add_pressed():
	var s = RotatingSystem.new()
	s.enabled = true
	s.awake = true
	s.name = "rotatingsystem"
	var _components = ["rotating"]
	ECS.add_system(s, _components)


func _on_Remove_pressed():
	ECS.remove_system("rotatingsystem")
