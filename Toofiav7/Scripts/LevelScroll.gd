extends ScrollContainer

export(int, 0.5, 1, 0.1) var card_scale = 1
export(float, 1, 1.5, 0.1) var card_current_scale = 1.2
export(float, 0.1, 1, 0.1) var scroll_duration = 1.3

var card_current_index: int = 0
var card_x_positions: Array = []

onready var scroll_tween: Tween = Tween.new()
onready var margin_r: int = $CenterContainer/MarginContainer.get("custom_constants/margin_right")
onready var card_space: int = $CenterContainer/MarginContainer/HBoxContainer.get("custom_constants/separation")
onready var card_nodes: Array = $CenterContainer/MarginContainer/HBoxContainer.get_children()

#Dummy Prelaod Scene
export var popupDialog: PackedScene = preload("res://Scenes/LevelsDummy.tscn")
#export var letterTraceDialog: PackedScene = preload("res://Scenes/LetterTraceLevels.tscn")

func _ready():
	add_child(scroll_tween)
	yield(get_tree(), "idle_frame")
	
	get_h_scrollbar().modulate.a = 0
	
	for _card in card_nodes:
		var _card_pos_x: float = (margin_r + _card.rect_position.x) - ((rect_size.x - _card.rect_size.x) / 2)
		_card.rect_pivot_offset = (_card.rect_size / 2)
		card_x_positions.append(_card_pos_x)
		
	scroll_horizontal = card_x_positions[card_current_index]
	scroll()


func _process(_delta: float):
	for _index in range(card_x_positions.size()):
		var _card_pos_x: float = card_x_positions[_index]
		var _swipe_length: float = (card_nodes[_index].rect_size.x / 2.0) + (card_space / 2.0)
		var _swipe_current_length: float = abs(_card_pos_x - scroll_horizontal)
		var _card_scale: float = range_lerp(_swipe_current_length, _swipe_length, 0.0, card_scale, card_current_scale)
		var _card_opacity: float = range_lerp(_swipe_current_length, _swipe_length, 0.0, 0.2, 1.0)
		
		_card_scale = clamp(_card_scale, card_scale, card_current_scale)
		_card_opacity = clamp(_card_opacity, 0.2, 1.0)
		
		card_nodes[_index].rect_scale = Vector2(_card_scale, _card_scale)
		card_nodes[_index].modulate.a = _card_opacity
		
		if _swipe_current_length < _swipe_length:
			card_current_index = _index


func scroll():
	var _scrollTween = scroll_tween.interpolate_property(
		self,
		"scroll_horizontal",
		scroll_horizontal,
		card_x_positions[card_current_index],
		scroll_duration,
		Tween.TRANS_BACK,
		Tween.EASE_OUT)
	
	for _index in range(card_nodes.size()):
		var _card_scale: float = card_current_scale if _index == card_current_index else card_scale
		var _scrollTween0 = scroll_tween.interpolate_property(
			card_nodes[_index],
			"rect_scale",
			card_nodes[_index].rect_scale,
			Vector2(_card_scale,_card_scale),
			scroll_duration,
			Tween.TRANS_QUAD,
			Tween.EASE_OUT)
			
	var _scrollStart = scroll_tween.start()

func _on_ScrollContainer_gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.pressed:
			var current_card = card_nodes[card_current_index]
			if current_card.modulate.a >= 1:
				var _scrollStopAll = scroll_tween.stop_all()
		else:
			var _onScroll = scroll()


func _input(event: InputEvent):
	if event is InputEventKey:
		if event.is_action_pressed("ui_right") and card_current_index < card_x_positions.size() - 1:
			card_current_index += 1
			print("Presses '=>' Right Key")
			scroll()
			
		if event.is_action_pressed("ui_left") and card_current_index > 0:
			card_current_index -= 1
			print("Presses '<=' Left Key")
			scroll()
			
			
#### THIS IS FOR THE BUTTONS!!
func _on_CardMenu1_pressed():
	$'/root/MenuClickSfxPlayer'.play()
	print("Presses 1")
	popupShows()
	print("Popupshows 1")

func _on_CardMenu2_pressed():
	$'/root/MenuClickSfxPlayer'.play()
	print("Presses 2")
	popupShows()
	print("Popupshows 2")

func _on_CardMenu3_pressed():
	$'/root/MenuClickSfxPlayer'.play()
	print("Presses 3")
	popupShows()
#	popupLetterTraceShows()
	print("Popupshows LetterTraceInfo")

func _on_CardMenu4_pressed():
	$'/root/MenuClickSfxPlayer'.play()
	print("Presses 4")
	popupShows()
	print("Popupshows 4")

func popupShows():
	$'/root/MenuClickSfxPlayer'.play()
	print("Going to Dummy Level")
	var dialogInstance = popupDialog.instance()
	add_child(dialogInstance)
	#var _nextLoad = get_tree().change_scene("res://Scenes/LevelsDummy.tscn")
	print("Dummy Level")

#func popupLetterTraceShows():
#	print("Going to LetterTraceInfo")
#	var dialogInstance = popupDialog.instance()
#	add_child(dialogInstance)
	#var _nextLoad = get_tree().change_scene("res://Scenes/LevelsDummy.tscn")
#	print("LetterTraceInfo")
