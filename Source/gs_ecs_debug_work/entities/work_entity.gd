extends Entity
class_name TestEntity

func on_ready():

	var _movable = get_component("movable")

	_movable.origin = self.position
	_movable.moveto_pos = self.position + Vector2(1, 0) * _movable.distance
	Logger.debug("- moveto: %s" % [_movable.moveto_pos])
