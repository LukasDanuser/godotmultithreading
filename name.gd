extends LineEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal new_username(string)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(_event):
	if editable == true:
		if Input.is_key_pressed(KEY_ENTER):
			if text != (""):
				emit_signal("new_username", text)
				editable = false
	else:
		return
