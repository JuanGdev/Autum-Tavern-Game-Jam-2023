extends Node2D

@onready var transition = $SceneTransition
@onready var buttonUI = $bottonUI
@onready var mainMusic = $AudioStreamPlayer2D
@onready var mainChar = $Daredevil

var pos

func _ready():
	Utils.loadGame()
	mainMusic.play()
	pos = mainChar.transform
	

func _process(delta):
	if(mainChar.position.y >1000): mainChar.transform = pos

func _on_play_pressed():
	buttonUI.play()
	transition.change_scene("res://tutorial_area/Tutorial_area.tscn")
	
func _on_quit_pressed():
	buttonUI.play()
	Utils.saveGame()
	get_tree().quit()


func _on_credits_pressed():
	buttonUI.play()
	transition.change_scene("res://TitleScreen/credits.tscn")
	

func _on_test_pressed():
	buttonUI.play()
	transition.get_tree().change_scene_to_file("res://TitleScreen/credits.tscn")
	buttonUI.play()
