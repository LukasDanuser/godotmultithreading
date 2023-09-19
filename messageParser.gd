extends Control

var arrayZ = ZThreadController.arrayZ
var message_queue = []
var thread_started = false
var mutex: Mutex

var clock = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	mutex = ZThreadController.mutex
	pass


func _process(delta):
	clock += delta
	ZThreadController.sendZtoClient = false
	if clock >= 1.0:
		clock = 0.0
		if arrayZ.size() <= 0:
			pass
		else:
			mutex.lock()
			arrayZ.pop_front()
			ZThreadController.sendZtoClient = true
			mutex.unlock()
	pass
