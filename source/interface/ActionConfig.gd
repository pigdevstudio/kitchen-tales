extends Control

"""
Description:
	
"""

export(String) var action = "left"

onready var button = $Button
onready var label = $Label

func _ready():
	set_process_input(false)
	label.text = InputMap.get_action_list(action)[0].as_text()
	button.connect("pressed", self, "_on_Button_pressed")


func _input(event):
	if event.is_echo():
		return
	if not event is InputEventKey:
		return
	if not event.is_pressed():
		return
	get_tree().set_input_as_handled()
	change_action_event(event)


func _on_Button_pressed():
	set_process_input(true)
	button.disabled = true
	label.text = "New key..."


func change_action_event(event):
	set_process_input(false)
	InputMap.action_erase_events(action)
	InputMap.action_add_event(action, event)
	label.text = event.as_text()
	button.disabled = false
