extends PopupPanel


signal load_requested(path: String)

const PATH := "user://saves/"
const ENDING := ".ini"

@export var SaveSlot: PackedScene

var saves := []
var save_num := 0


func _ready() -> void:
	hide()
	if not DirAccess.dir_exists_absolute(PATH):
		DirAccess.make_dir_absolute(PATH)
		return
	var dir := DirAccess.open(PATH)
	dir.list_dir_begin()
	var file := dir.get_next()
	while file:
		saves.append(file)
		file = dir.get_next()
	dir.list_dir_end()
	saves.sort_custom(func(a, b): return a.naturalnocasecmp_to(b) > 0)
	if saves.size() > 0:
		save_num = int(saves[0].replace(ENDING, "")) + 1
	var i := 0
	while i < saves.size():
		var config := ConfigFile.new()
		if config.load(PATH + saves[i]) == OK:
			var date = config.get_value("metadata", "time", {})
			if date is Dictionary and date.has_all(["year", "month", "day", "hour", "minute", "second"]):
				var s := SaveSlot.instantiate()
				%Slots.add_child(s)
				s.init(date)
				s.overwrite.connect(on_slot_overwrite)
				s.load_requested.connect(on_slot_load)
				s.delete.connect(on_slot_delete)
				i += 1
			else:
				saves.remove_at(i)
		else:
			saves.remove_at(i)
	
	
func show_save_load(can_save := false) -> void:
	for slot in %Slots.get_children():
		slot.toggle_overwrite(can_save)
	%New.disabled = not can_save
	popup_centered()
	get_tree().paused = true


func _on_popup_hide() -> void:
	get_tree().paused = false


func _on_new_pressed() -> void:
	var s := SaveSlot.instantiate()
	%Slots.add_child(s)
	%Slots.move_child(s, 0)
	var date := Time.get_datetime_dict_from_system()
	s.init(date)
	s.overwrite.connect(on_slot_overwrite)
	s.load_requested.connect(on_slot_load)
	s.delete.connect(on_slot_delete)
	saves.push_front(str(save_num) + ENDING)
	var config := ConfigFile.new()
	config.set_value("metadata", "time", date)
	config.save(PATH + str(save_num) + ENDING)
	save_num += 1


func _on_delete_all_pressed() -> void:
	for child in %Slots.get_children():
		child.queue_free()
	for save in saves:
		DirAccess.remove_absolute(PATH + save)
	saves = []
	save_num = 0


func on_slot_overwrite(i: int) -> void:
	var path: String = saves.pop_at(i)
	saves.push_front(path)
	%Slots.move_child(%Slots.get_child(i), 0)
	var date := Time.get_datetime_dict_from_system()
	%Slots.get_child(0).init(date)
	var config := ConfigFile.new()
	config.set_value("metadata", "time", date)
	config.save(PATH + saves[0])


func on_slot_load(i: int) -> void:
	hide()
	load_requested.emit(PATH + saves[i])
	

func on_slot_delete(i: int) -> void:
	DirAccess.remove_absolute(PATH + saves[i])
	saves.remove_at(i)
	%Slots.get_child(i).queue_free()
