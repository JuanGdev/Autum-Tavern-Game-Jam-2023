extends Window

signal dialogue_finished

var lines: PackedStringArray
var current := -1

@onready var d_title := $PanelContainer/HBoxContainer/VBoxContainer/Title
@onready var speech := $PanelContainer/HBoxContainer/VBoxContainer/Speech
@onready var timer := $PanelContainer/HBoxContainer/VBoxContainer/Speech/Timer


func _ready() -> void:
	hide()
	set_process_unhandled_input(false)
	

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if timer.is_stopped():
			advance()
		else:
			speech.visible_ratio = 1.0
			timer.stop()


func show_dialogue(path: String) -> void:
	get_tree().paused = true
	show()
	set_process_unhandled_input(true)
	current = -1
	
	lines = PackedStringArray([])
	var file := FileAccess.open(path, FileAccess.READ)
	while not file.eof_reached():
		var line = file.get_line()
		if line:
			lines.append(line)
	advance()
	
	
func advance() -> void:
	current += 1
	if current >= lines.size():
		get_tree().paused = false
		hide()
		dialogue_finished.emit()
		set_process_unhandled_input(false)
		return
	var array := lines[current].split("|", true, 1)
	if array.size() == 0:
		advance()
		return
	if array.size() == 1:
		speech.text = array[0]
	else:
		d_title.text = array[0]
		speech.text = array[1]
	speech.visible_ratio = 0.0
	timer.start()
	

func _on_timer_timeout() -> void:
	speech.visible_characters += 1
	if not speech.visible_ratio == 1.0:
		timer.start()
