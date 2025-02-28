class_name FileLoader

func load(path: String) -> String:
	var file = FileAccess.open(path, FileAccess.READ)
	return file.get_as_text()
