extends Node


#
func _on_ExitButton_pressed():
	print("Presses Go back")
	var _nextLoad = get_tree().change_scene("res://Scenes/MenuChoices.tscn")
	print ("Closes Popup")
	$'/root/MenuClickSfxPlayer'.play()
	print("Going to Menu  Choices")
