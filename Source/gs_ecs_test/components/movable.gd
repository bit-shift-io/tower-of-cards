extends Component
class_name Movable

export (int) var SPEED = 5
export (int) var SPEED_FACTOR = 10
export (int) var DISTANCE = 100


var origin = Vector2()
var distance = 100
var speed = 0
var speed_factor = 10
var moveto_pos = Vector2()
var direction = 1


func _ready():

	if SPEED:			speed = SPEED
	if SPEED_FACTOR:	speed_factor = SPEED_FACTOR
	if DISTANCE:		distance = DISTANCE
