extends LineEdit

onready var username = ""
var id = 1
onready var message_text = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

signal new_message(message_text, username, id)

func _input(_event):
	if Input.is_key_pressed(KEY_ENTER):
		if text and username != (""):
			message_text = text
			var userid = username + str(id)
			emit_signal("new_message", message_text, username, userid)
			id += 1
			clear()
		else:
			print("select username or enter message first!")

func _on_name_new_username(string):
	username = string
	clear()
	pass # Replace with function body.
