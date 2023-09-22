extends Node2D


func _ready():
	Utils.loadGame()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Bar_Testmap/test_bar.tscn")


func _on_quit_pressed():
	Utils.saveGame()
	get_tree().quit()
