"""
	Class: System

	Helper Class for a Developer to add a System process
	to the ECS Framework.

"""
class_name System
extends Node

export var COMPONENTS = ""
export var ENABLED = true
export var AWAKE = true

var components = ""
var enabled = false
var awake = false

# virtual calls

func on_before_add():
	Logger.trace("[system] on_before_add")

func on_after_add():
	Logger.trace("[system] on_after_added")

func on_before_remove():
	Logger.trace("[system] on_before_remove")

func on_after_remove():
	Logger.trace("[system] on_after_remove")

func on_process(entities, delta):
	for entity in entities:
		on_process_entity(entity, delta)


func on_process_entity(entity, delta):
	Logger.trace("[system] on_process_entity")
	pass

func _ready():

	if COMPONENTS:	components = COMPONENTS
	if ENABLED:		enabled = ENABLED
	if AWAKE:		awake = AWAKE

	var _components = components.to_lower().split(",")
	ECS.add_system(self, _components)