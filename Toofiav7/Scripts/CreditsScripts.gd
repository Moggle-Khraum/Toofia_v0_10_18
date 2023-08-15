extends Popup

#####################################################################
	
#This will show the Tutorial to the player
func _on_ShowTutorialBtn_pressed():
	#This will produce a click sound
	$'/root/MenuClickSfxPlayer'.play()
	print("Presses Tutorial|Dummy")
	#This will change into a new scene, namely, the Tutorials
	var _nextScene = get_tree().change_scene("res://Scenes/TutorialDummy.tscn")
	print ("Shows Tutorial")
	#Toggles pauses
	$'/root/MusicThemePlayer'.toggle_pause()
	
#This will show the Credits to the player
func _on_ShowCreditsBtn_pressed():
	#This will produce a click sound
	$'/root/MenuClickSfxPlayer'.play()
	#Prints the message
	print("Presses Credits")
	#This will change into a new scene, namely, the Credits
	var _nextScene = get_tree().change_scene("res://Scenes/CreditsShows.tscn")
	print("Shows Credits")
	#Toggels Pauses
	$'/root/MusicThemePlayer'.toggle_pause()
	
#This will go back to the main menu
func _on_BackButton_pressed():
	$'/root/MenuClickSfxPlayer'.play()
	print("Presses Go Back")
	var _nextScene = get_tree().change_scene("res://Scenes/MainMenu.tscn")
	print("Presses Go Back Button")

###############################################################



