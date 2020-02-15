extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_ECS_pressed():
	get_tree().change_scene("res://gs_ecs_test/tests/test_debug_entity.tscn")
	pass # Replace with function body.


func _on_Test3D_pressed():
	get_tree().change_scene("res://test3d/test3d.tscn")
	pass # Replace with function body.
