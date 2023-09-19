extends Label

var previous_lines = ""

onready var full_text = {}

func _ready():
	
	pass # Replace with function body.

func new_message(message_text, username, id):
	previous_lines = ""
	if full_text.has(id):
		print ("ERROR: ID OVERLAP!")
		return
	full_text[id] = username + ": " + message_text
	refresh_chatbox()
	MultiplayerManager.send_dict(full_text)

func refresh_chatbox():
	previous_lines = ""
	for id in full_text:
		previous_lines = previous_lines + full_text.get(id) + "\n"
	if full_text.size() >=  19:
		for line in full_text:
			full_text.erase(line)
	text = previous_lines

func _on_LineEdit_new_message(message_text, username, id):
	new_message(message_text, username, id)
