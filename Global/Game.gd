extends Node

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


const RUNNING_SPEED = 500.0
const SPEED_CAP = 800.0
const SLOW_SPEED = 250.0
const MAX_FALLING_SPEED = 200.0
var DEATHFALL = false
var HEALTH = 1
var ADREN = 1000
var SCORETOTAL = 10000
var SCORECURRENT = 0
var CURRENT_SPEED = Vector2.ZERO
const JUMP_VELOCITY = -400.0
var BOOSTED = false
var SLOWED = false

