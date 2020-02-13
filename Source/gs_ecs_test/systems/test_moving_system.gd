extends System
class_name MovingSystem


func on_process(entities, delta):

	for entity in entities:

		var _movable = entity.get_component("movable")

		if _movable.direction == 1:
			if entity.position.x > _movable.moveto_pos.x:
				_movable.direction = -1

		if _movable.direction == -1:
			if entity.position.x < _movable.origin.x:
				_movable.direction = 1

		entity.position += Vector2(1, 0) * _movable.direction * _movable.speed * _movable.speed_factor * delta
