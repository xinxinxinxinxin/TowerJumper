extends Control

onready var game = get_node ("Spatial")
onready var width = Globals.get("display/width")

var last_pos = 0
var is_pressed = false

func _ready():
	get_node("LevelLabel").set_text("Level " + str(global.level))
	set_process_input(true)
	pass

func handle_pos (pos):	
	if (!game.receive_input (pos)):
		last_pos = get_local_mouse_pos().x
		game.lock_rot();
	
func _input(event):	
	if (event.type==InputEvent.SCREEN_TOUCH):
		last_pos = get_local_mouse_pos().x
		game.lock_rot();
	if (event.type==InputEvent.SCREEN_DRAG):
       handle_pos (float(-(get_local_mouse_pos().x - last_pos) * 100) / width)	
	
