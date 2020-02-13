extends DebugNode

func on_draw():

	var _energy = debug.entity.get_component("energy") as Energy

	# draw line going down

	draw_line(debug.entity.position, debug.entity.position + Vector2(0, 1) * 100, DEBUG_COLOR_LINE_2, 1.0, true)

	# print the value of energy

	draw_text(debug.entity.position + Vector2(0, 1) * 100, [str(_energy.energy)])

	# draw circle

	draw_circle_arc(debug.entity.position, 50.0, 0, 360, DEBUG_COLOR_LINE_3)

	# draw a line going left for the length of energy value

	draw_line(debug.entity.position, debug.entity.position + Vector2(-1, 0) * _energy.energy, DEBUG_COLOR_LINE_4, 4.0, true)
