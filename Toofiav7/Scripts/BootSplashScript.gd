extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
#This is for initializing the config folder creation
	print("Creating Config folder")
	create_config_folder()
	#End of config folder creation
	#create_default_language()

#This is for the bootsplash only code
	var TW = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
	TW.tween_property($GodotLogo, "scale",
		 Vector2(0.3, 0.3), 0.8)
	TW.tween_interval(0.2)
	TW.tween_callback($CanvasLayer/GodotLabel, "set", ["text", "GODOT"])
	TW.tween_interval(0.5)
	TW.tween_callback($CanvasLayer/EngineLabel, "set", ["text", "ENGINE"])
	yield(TW,"finished")
	print("Done openFades")
	closingFades()

func closingFades():
	var tw2 = create_tween().set_trans(Tween.TRANS_CIRC)
	tw2.tween_property($GodotLogo, "scale",
		Vector2(0, 0), 1.0).set_ease(Tween.EASE_IN)
	tw2.tween_interval(0.3)
	tw2.tween_callback($CanvasLayer/GodotLabel, "set", ["text", " "])
	tw2.tween_callback($CanvasLayer/EngineLabel, "set", ["text", " "])
	yield(tw2, "finished")
	nextScene()
	print("Done closingFades")
	
func nextScene():
	yield(get_tree().create_timer(1.0), "timeout")
	var _nextSceneInstance = get_tree().change_scene("res://Scenes/StudioScene.tscn")
	print("NextScene")

#Start of Settings Folder Config creation
#This will create the config folder on bootsplash
func create_config_folder():
	print("Creating..")
	# Ensure the configuration folder exists
	var config_dir = "user://settings"
	var dir = Directory.new()
	if not dir.dir_exists(config_dir):
		dir.make_dir_recursive(config_dir)
		print("Create Folder Finish")

 












