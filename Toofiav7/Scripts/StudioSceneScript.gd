extends Node

onready var panel_up: Panel = $CanvasLayer2/PanelUp
onready var panel_down: Panel = $CanvasLayer2/PanelDown

func _ready():
	print("Opening Gate")
	# Call the open_gate function to start the animation
	open_gate()
	

func open_gate():
	var properties = {
		panel_up: {
			"rect_position": Vector2(0, -312)
		},
		panel_down: {
			"rect_position": Vector2(0, 597)
		}
	}
	animate_gate(properties, 1.0, "_on_gate_opened")
	_on_gate_opened()
	print("Initiate Gate")

func animate_gate(properties, duration, _signal_function):
	var tween = Tween.new()
	add_child(tween)

	for panel_node in properties:
		var panel_properties = properties[panel_node]
		for prop in panel_properties:
			var start_value = panel_node[prop]
			var end_value = panel_properties[prop]
			tween.interpolate_property(panel_node, prop, start_value, end_value, duration, Tween.TRANS_LINEAR)
	tween.start()
	print("Gate Openned")

func _on_gate_opened():
	yield(get_tree().create_timer(2.0), "timeout")
	print("Initiating Closing Gate")
	closeGate()

func closeGate():
	var properties = {
		panel_up: {
			"rect_position": Vector2(0, 0)
		},
		panel_down: {
			"rect_position": Vector2(0, 310)
		}
	}
	animate_gate(properties, 1.0, "gate_closed")
	print("Closing the Gate")
	yield(get_tree().create_timer(2.0), "timeout")
	print("TimerClosed")
	gate_closed()

func gate_closed():
	#Frees the Queue
	panel_up.queue_free()
	panel_down.queue_free()
	#Prints teh Debug Text
	print("Closed Gate")
	#Changes into the next scene
	var _nextLoad = get_tree().change_scene("res://Scenes/LoadingScreen.tscn")
	print("Going to Loading Screen")
