extends Node


var current_scene: Node
var current_actions: Array[InteractableAction]


func _ready() -> void:
	call_deferred("change_scene", "res://scenes/title/title.tscn")
	
	
func change_scene(to: String) -> void:
	if current_scene:
		current_scene.free()
	var packed = load(to)
	if not packed is PackedScene:
		push_error("Failed to load scene from %s!" % to)
		return
	current_scene = packed.instantiate()
	add_child(current_scene)
	if current_scene.has_signal("change_scene"):
		current_scene.change_scene.connect(change_scene, CONNECT_DEFERRED)
	for interactable in get_tree().get_nodes_in_group("interactables"):
		interactable.interacted.connect(on_interacted)


func on_interacted(actions: Array[InteractableAction]) -> void:
	current_actions = actions.duplicate()
	next_action()


func next_action() -> void:
	if current_actions.size() == 0:
		return
	var current_action = current_actions.pop_front()
	if current_action is DialogueAction:
		Dialogue.dialogue_finished.connect(next_action, CONNECT_ONE_SHOT)
		Dialogue.show_dialogue(current_action.dialogue_path)
	else:
		next_action()
