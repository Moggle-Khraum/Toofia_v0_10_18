extends Node




#This Handles the Quit Button
func _on_ExitButton_pressed():
	$'/root/MenuClickSfxPlayer'.play()
	get_tree().quit()
	print("Presses Exit")

