extends Control


#Handles the name input
var user_name: String = ""
#Path to save the File
const USERNAME_FILE_PATH = "user://settings/username.gmd"

# Called when the node enters the scene tree for the first time.
func _ready():
	#Getting the node that handles input
	var name_input = get_node("Panel/LineEdit")
	name_input.connect("text_changed", self, "_on_NameEntered")
	print("Text Connected")
	
#Handles the text entered
func _on_NameEntered(new_text):
	user_name = new_text
	print("New Text Input")

func _on_EnterButton_pressed():
	$'/root/AcceptClickSfxPlayer'.play()
	if user_name != "":
		var name_input = get_node("Panel/LineEdit")
		var _new_user_name = name_input.text
		var _nextLoad = get_tree().change_scene("res://Scenes/MainMenu.tscn")
		print("Entered Name Saved")
		
		# Open the file in write mode
		var config = File.new()
		if config.open(USERNAME_FILE_PATH, File.WRITE) == OK:
		# Write the player's name to the file
			config.store_string(user_name)
			config.close()
			print("username saved")
		#Transition to the main menu scene
		
		





