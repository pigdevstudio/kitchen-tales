extends Button

export (String) var link

func _ready():
	connect("button_up", self, "open_link")


func open_link():
	OS.shell_open(link)
