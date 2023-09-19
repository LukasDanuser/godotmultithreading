extends Control

var message_thread: Thread
var arrayZ = []
var message_queue = []
var parser: messageParser
var mutex: Mutex
var sendZtoClient: bool
var id = 1

func _ready():
	mutex = Mutex.new()
	message_thread = Thread.new()
	message_thread.start(self, "_process_messages", null, 1)
	print("Thread has started!")
	pass

func _process(delta):
	if sendZtoClient == true:
		var size = arrayZ.size()
		var payload = String(size) + " Zs left"
		var userid = "Server" + str(id)
		id += 1
		ChatBox.new_message(payload, "Server", userid)

func _process_messages():
	parser = messageParser.new()

# This function allows the main thread to send messages to the worker thread
func send_message(dict: Dictionary):
	print("Received a message...")
	var valid = dict["valid"]
	var message = dict["message"]
	var zAmount = dict["zAmount"]
	
	mutex.lock()
	for i in zAmount:
		arrayZ.append(message)
	mutex.unlock()
