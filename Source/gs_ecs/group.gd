
"""
	Class: Group

	Helper Class for the Developer to create a
	collection of Systems to Run during the
	game.

	Remarks:

		A Group is a way to place Systems together. This is useful
		when you want to control what happens to a number of entities
		without having to control each individual component on
		the entity.

	How To Use:

		Place this Class, or Sub Class it onto a Parent Node. Any
		Child Node should be a type of System.

"""
class_name Group
extends Node

func _ready():

	var _systems = []
	for _system in get_children():
		_systems.append(_system.name.to_lower())
	ECS.add_group(self, _systems)