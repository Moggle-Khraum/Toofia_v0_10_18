extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	load_bbcode_from_file("res://Assets/credits/authors.credits")

func load_bbcode_from_file(file_path: String):
	var file = File.new()
	if file.open(file_path, File.READ) == OK:
		var bbcode_text = file.get_as_text()
		file.close()
		set_bbcode(bbcode_text)

