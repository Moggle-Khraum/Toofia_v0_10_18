extends Control



######################################################
func _on_GoBackButton_pressed():
	print("Presses Go Back")
	$'/root/MenuClickSfxPlayer'.play()
	#handles the Go back button
	var _nextLoad = get_tree().change_scene("res://Scenes/MainMenu.tscn")
	print("Going to Main Menu")
#####################################################







