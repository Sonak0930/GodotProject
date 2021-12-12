extends Node

var stage = 1 # stage number equals to level number (not index number)
var drawingName = ""
onready var drawing

var path = "user://data.json"

var default_data = {
	"level": 1
}

var data = { }

func _ready():
	print("GameManager started")
	load_game()
	print("Stage status: ", str(stage))


func advanceStage():
	stage += 1
	if stage > 7:
		stage = 7  # Stage all finished

func load_game():
	var file = File.new()
	
	if not file.file_exists(path):
		reset_data()
		return
		
	file.open(path, file.READ)
	var text = file.get_as_text()
	data = parse_json(text)
	stage = data["level"]
	
	file.close()

func save_game():
	data = {
		"level": stage
	}
	var file = File.new()
	file.open(path, File.WRITE)
	file.store_line(to_json(data))
	file.close()

func reset_data():
	data = default_data.duplicate(true)



