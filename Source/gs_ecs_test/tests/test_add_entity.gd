extends Node

"""
	This test adds an Entity using Script instead of
	using the Entity Help class.

	Entities added this way will not have access to any
	of the Helper methods in the entity.gd class.

	You can of course, make your own if you want to as
	well.

"""

func _ready():
	ECS.add_entity($AnotherEntity)
	Logger.debug(ECS.entities)
