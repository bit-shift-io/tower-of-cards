#extends "res://gs_ecs_debug/nodes/debug_node.gd" # DebugNode
extends DebugNode

func on_draw():

	var _energy = debug.entity.get_component("energy") as Energy

	draw_line(debug.entity.position, debug.entity.position + Vector2(0, 1) * 100, DEBUG_COLOR_LINE_1, 1.0)
	draw_text(debug.entity.position + Vector2(0, 1) * 100, [str(_energy.energy)])

	# draw circle

	draw_circle_arc(debug.entity.position, 50.0, 0, 360, DEBUG_COLOR_LINE_1)
