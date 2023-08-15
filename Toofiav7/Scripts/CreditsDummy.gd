extends Control

func _on_ExitButton_pressed():
	#This will produce a click sound
	$'/root/MenuClickSfxPlayer'.play()
	print("Presses Go Back")
	#$'.'.hide()
	var _nextLoad = get_tree().change_scene("res://Scenes/MainMenu.tscn")
	#This will play the music
	#$'../MusicThemePlayer'.play()
	#$'.'.queue_free()
	print ("Closes Credits Shows")
