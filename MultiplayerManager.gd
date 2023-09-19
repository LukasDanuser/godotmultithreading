extends Control

#var worker_thread = preload("res://ZThread.gd").new()

func _ready():
	#ZThread.start()
	pass


func _on_Host_button_up():
	var host = NetworkedMultiplayerENet.new()
	host.create_server(2000)
	get_tree().set_network_peer(host)
	pass


func _on_Join_button_up():
	var ip = $ipAddress.text
	var host = NetworkedMultiplayerENet.new()
	host.create_client(ip, 2000)
	get_tree().set_network_peer(host)
	pass

sync func send_dict(dict):
	rpc("receive_dict", dict)


func checkMessage(dict):
	var currentMessageID = dict.size() - 1
	var usernameAndID = dict.keys()[currentMessageID]
	var tempUsername = usernameAndID.left(usernameAndID.length() - 1)
	var formattingUsername = tempUsername + ": "
	var message = dict.values()[currentMessageID].replace(formattingUsername, "").to_lower()
	var amountZ = 0
	if(message.begins_with("z")):
		var removeZ = message.right(1)
		if(removeZ.is_valid_integer()):
			amountZ = removeZ
			return {"valid": true, "message": message, "zAmount": int(amountZ)}
		else:
			return {"valid": false}
	elif(message == "stop"):
		return {"valid": true, "message": message, "zAmount": int(amountZ)}
		pass
	else:
		return {"valid": false}

sync func receive_dict(dict):
	var resultDict = checkMessage(dict)
	if (resultDict["valid"] == true):
		ZThreadController.send_message(resultDict)
		pass
	else:
		ChatBox.full_text.merge(dict)
		ChatBox.refresh_chatbox()
