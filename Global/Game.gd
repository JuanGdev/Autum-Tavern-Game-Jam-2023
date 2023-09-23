extends Node

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var HEALTH = 3
var ADREN = 1000
var SCORETOTAL = 10000
var SCORECURRENT = 0
var CURRENT_SPEED = Vector2.ZERO
const JUMP_VELOCITY = -400.0
var BOOSTED = false
var SLOWED = false

