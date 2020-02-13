extends Node

onready var Rotating = preload("res://gs_ecs_test/components/rotating.gd")

func _process(delta):
	ECS.update()


func _on_AddRotation_pressed():
	var new = Rotating.new()
	new.name = "rotating"
	ECS.entity_add_component($ControlledEntity/Controlled1, new)



func _on_RemoveRotation_pressed():
	ECS.entity_remove_component($ControlledEntity/Controlled1, "rotating")
