extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label/AnimationPlayer.play('dissolve')
	await $Label/AnimationPlayer.animation_finished
	$Label/AnimationPlayer.play('runCredits')
