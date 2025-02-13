extends Control

var fourk_found = false
var sevenk_found = false

func _ready():
	get_viewport().files_dropped.connect(on_files_dropped)

func on_files_dropped(files):
	var file_path_as_string = "".join(files)
	var file := FileAccess.open(file_path_as_string, FileAccess.READ)

	for line in file.get_as_text().to_lower().split("\n"):
		if "keys:" in line.strip_edges():
			var words = line.strip_edges().split(" ")
			for word in words:
				if word.is_valid_int() and int(word) == 4:
					fourk_found = true
				else:
					fourk_found = false
		if "hitposition:" in line.strip_edges() and fourk_found:
			print(line.strip_edges())
		if "columnstart:" in line.strip_edges() and fourk_found:
			print(line.strip_edges())
		if "columnspacing:" in line.strip_edges() and fourk_found:
			print(line.strip_edges())
		if "scoreposition:" in line.strip_edges() and fourk_found:
			print(line.strip_edges())
		if "comboposition:" in line.strip_edges() and fourk_found:
			print(line.strip_edges())
		if "columnwidth:" in line.strip_edges() and fourk_found:
			print(line.strip_edges())
		if "widthfornoteheightscale:" in line.strip_edges() and fourk_found:
				print(line.strip_edges())
