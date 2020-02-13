extends Component
class_name Energy

"""
	Component: Energy

	Provides a level of Energy for an Entity.
"""

export var ENERGY = 100
export var ENERGY_MAX = 100

var energy_max = 100
var energy = 0


func _ready():

	if ENERGY:
		energy = ENERGY

	if ENERGY_MAX:
		energy_max = ENERGY_MAX

