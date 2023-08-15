extends Panel

const MUSIC_PLAYBACK_SECTION = "music"
const MUSIC_PLAYBACK_KEY = "is_playing"

var music_file = "user://settings/musicConfig.cfg"
var music_playing = false
var music_player = MusicThemePlayer

func _ready():
	load_music_config()
	if music_playing:
		music_player.play()

func save_music_config():
	var music_config = ConfigFile.new()

	# Save music playback state
	music_config.set_value(MUSIC_PLAYBACK_SECTION, MUSIC_PLAYBACK_KEY, music_playing)

	var file = File.new()
	print("Writing Music Config")
	if file.open(music_file, File.WRITE) == OK:
		music_config.save(file.get_path()) # Use get_path() to get the file path as String
		file.close()
		print("Music Config saved")

func load_music_config():
	print("Loading Music Config")
	var file = File.new()
	if file.file_exists(music_file) && file.open(music_file, File.READ) == OK:
		var config = ConfigFile.new()
		var error = config.load(file.get_path()) # Use get_path() to get the file path as String
		file.close()

		if error == OK:
			music_playing = config.get_value(MUSIC_PLAYBACK_SECTION, MUSIC_PLAYBACK_KEY, false)
			print("Music Playback:", music_playing)
		else:
			print("Error loading music config file:", error)

		print("Loading Music Config Done")
	else:
		print("Music config file does not exist. Using default settings.")
		save_music_config() # Create a new config file with default settings

func _on_MusicTextureButton_toggled(button_pressed):
	if button_pressed:
		music_playing = !music_playing
		if music_playing:
			# Play music
			music_player.play()
			print("Music Play")
		else:
			# Stop music
			music_player.stop()
			print("Music Stop")

		save_music_config()



