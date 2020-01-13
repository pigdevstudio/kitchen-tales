extends VBoxContainer

onready var line_edit = $LineEdit

func show():
	.show()
	line_edit.grab_focus()


func _on_LineEdit_text_entered(new_text):
	hide()
