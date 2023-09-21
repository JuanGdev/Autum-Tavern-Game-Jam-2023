extends Area2D
class_name Interactable


signal interacted(actions: Array[InteractableAction])

@export var actions: Array[InteractableAction]


func interact() -> void:
	interacted.emit(actions)
