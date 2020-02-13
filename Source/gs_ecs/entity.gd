"""
	Class: Entity

	Helper Class for Developers to quickly attach to a Node to
	mark it as an Entity.

	Components are automatically added to the Entity in the
	Framework.

	Remarks:

		This Class, has a number of virtual methods as a convenience to
		the developer using the Framework.


"""
class_name Entity
extends Node

var id setget, _get_id
var enabled = true

# virtual calls

func on_init():
	Logger.trace("[entity] on_init")

func on_ready():
	Logger.trace("[entity] on_ready")

func on_before_add():
	Logger.trace("[entity] on_before_add")

func on_after_add():
	Logger.trace("[entity] on_after_add")

func on_before_remove():
	Logger.trace("[entity] on_before_remove")

func on_after_remove():
	Logger.trace("[entity] on_after_remove")


func add_component(component):
	ECS.entity_add_component(self, component)

func get_component(component_name):
	return ECS.entity_get_component(self.id, component_name)

#
func has_component(component_name):
	return ECS.entity_has_component(self.id, component_name)


func remove_component(component_name):
	ECS.entity_remove_component(self, component_name)


func _get_id():
	return get_instance_id()


func _ready():
	Logger.trace("[entity] _ready")
	# add self as an entity
	ECS.add_entity(self)
	# loop through all child nodes of Components and add to entity component list
	if find_node("Components", false):
		for child in find_node("Components", false).get_children():
			ECS.entity_add_component(self, child)
	else:
		Logger.warn("No Components found")

	on_ready()


func _init():
	Logger.trace("[entity] _init")
	on_init()