extends Node


func _on_ExitButton_pressed():
	print("Presses 'X'")
	var _nextLoad = get_tree().change_scene('res://Scenes/MainMenu.tscn')
	print ("Closes Popup")
	$'/root/MenuClickSfxPlayer'.play()
	print("Going to Credits")


#func _on_LevelButton_pressed():
#	print("Presses 'Lets Play'")
#	var _nextLoad = get_tree().change_scene("res://Scenes/AlphabetTracing.tscn")
#	print ("Closes Info")
#	print("Going to Level Selector")
