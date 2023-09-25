extends Node2D

@onready var transition = $SceneTransition
func _ready():
	Utils.loadGame()

func _on_play_pressed():
	transition.change_scene("res://tutorial_area/Tutorial_area.tscn")
	


func _on_quit_pressed():
	Utils.saveGame()
	get_tree().quit()


func _on_credits_pressed():
	transition.change_scene("res://TitleScreen/credits.tscn")
	
	


func _on_test_pressed():
	SceneTransition.get_tree().change_scene_to_file("res://TitleScreen/credits.tscn")
