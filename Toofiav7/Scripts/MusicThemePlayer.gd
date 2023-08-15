extends AudioStreamPlayer

var paused: bool = false
var playback_position: float = 0.0
var restart_timer: Timer

func _ready():
	# Initialize the player, start playing the music
	toggle_pause()
	
	# Create and set up the restart timer
	restart_timer = Timer.new()
	add_child(restart_timer)
	var _restartTimer = restart_timer.connect("timeout", self, "_on_restart_timer_timeout")
	restart_timer.wait_time = 2.5
	
#Music Toggler
func toggle_pause():
	if !paused:
		# Pause the music
		playback_position = get_playback_position()
		stop()
		paused = true
	else:
		# Resume the music from where it was paused
		play()
		seek(playback_position)
		paused = false

func _on_MusicThemePlayer_finished() -> void:
	if !paused:
		# If not paused, restart the music
		play()
