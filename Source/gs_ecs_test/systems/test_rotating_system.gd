extends System
class_name RotatingSystem

func on_process(entities, delta):
	for entity in entities:
		var _rot = entity.get_component("rotating")
		entity.rotation += _rot.direction * _rot.speed * _rot.speed_factor * delta
