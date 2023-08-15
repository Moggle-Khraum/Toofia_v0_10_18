extends Panel

var music_position = 0

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:


#func _on_NarratorCheckBox_toggled(button_pressed: bool) -> void:
	


func _on_MusicCheckBox_toggled(button_pressed: bool) -> void:
	#The code from Stackoverflow by Elinder
	if button_pressed:
		print("Play Music")
		$'/root/MusicThemePlayer'.play(music_position)
	else:
		music_position = $'/root/MusicThemePlayer'.get_playback_position()
		$'/root/MusicThemePlayer'.stop()
		print("Stops Music")
	
	
	
	
