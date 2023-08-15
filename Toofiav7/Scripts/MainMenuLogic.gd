extends Control

#This is for the First Run and Name Save
#The extension '.GMD' means '[G]a[M]e [D]ata
const CONFIG_FILE_PATH = "user://settings/first_run.gmd"
const USERNAME_FILE_PATH = "user://settings/username.gmd"
#
#############################################
#For the Sprite
var tweenScales

#Preload for the Popup scene
#Name Popup
onready var namepopups = preload("res://Scenes/PopupEnterName.tscn")

#This is the main body
func _ready():
	#Plays the Music
	$'/root/MusicThemePlayer'.toggle_pause()
	#Plays the animation function
	_onFade()
	#This initiate the Fade Transition
	print("Plays FadeScale")
	
	#This displays the Username into the label
	var config = File.new()
	if config.open(USERNAME_FILE_PATH, File.READ) == OK:
		# Read the stored username from the file
		print("Reads GMD file")
		var userName = config.get_as_text()
		config.close()
		# Display the username in the label
		$Panel/DisplayName.text = userName
		print("Name Showed")
	
#THis is for the buttons
func _on_PlayButton_pressed():
	$'/root/AcceptClickSfxPlayer'.play()
	print("Presses Play Button0")
	#THis handles if the device has both
	if hasFile() and !hasUsername():
		showNamePopup()
		print("Shows Name Popup")
	else:
		redirectMainMenu()
		print("Redirected to Main Menu")
		
#If the device has the file
func hasFile():
	print("Checking GMD file")
	var config = File.new()
	if config.file_exists(CONFIG_FILE_PATH):
		config.open(CONFIG_FILE_PATH, File.READ)
		var _data_name = config.get_as_text()
		config.close()
		print("Check GMD Done")
		return true
	return false
	
#Detects if username.gmd exist
func hasUsername():
	print("Checking Username")
	var config = File.new()
	print("Check Name Done")
	return config.file_exists(USERNAME_FILE_PATH)

#Shows popup where name can be type in
func showNamePopup():
	print("Shows Popup")
	var dialogInstance = namepopups.instance()
	add_child(dialogInstance)
	print("popup showed")

#Redirects to main menu
func redirectMainMenu():
	print("Presses Play Button")
	var _nextLoad = get_tree().change_scene("res://Scenes/MenuChoices.tscn")
	$'/root/MusicThemePlayer'.toggle_pause()
	print("To Play Scene")

#This for the Credits Button
func _on_CreditsButton_pressed():
	$'/root/MenuClickSfxPlayer'.play()
	print("Presses Credits Button")
	#This will popup the Credits Scene
	$CreditsPopup.show()
	print("To Credits Scene")

#This is for the Exit Button
func _on_ExitButton_pressed():
	print("Presses Exit")
	get_tree().quit()
	print("Exits Game")

#This handles the Fade Animation
func _onFade():
	print("Plays FadeScale")
	#This is for Menu and Loading Animation
	tweenScales = create_tween().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
	tweenScales.tween_property($FadeScale, "rect_position", Vector2(-540, 300), 1.0)
	tweenScales.tween_interval(0.9)
	#Creates a delay 1.3s
	yield(tweenScales,"finished")
	#queue_free()
	print("Done FadeScaleOut")
#End of _onFade


