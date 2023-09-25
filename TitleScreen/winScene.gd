extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D/AnimationPlayer.play("RESET")
	$Sprite2D/AnimationPlayer.play("winAnimation")
	$AudioStreamPlayer2D.play()
	$AudioStreamPlayer2D/AudioStreamPlayer2D.play()
