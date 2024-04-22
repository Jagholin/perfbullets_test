@tool
class_name MainWindow
extends Control

signal window_changed(bounding_box: Rect2)

@export var view_width: float = 400.0:
	set(newValue):
		if newValue == view_width:
			return
		view_width = newValue
		_on_item_rect_changed()
@export var top_bottom_margin: float = 10.0:
	set(newValue):
		if newValue == top_bottom_margin:
			return
		top_bottom_margin = newValue
		_on_item_rect_changed()
@onready var cutout_rect: ColorRectWithCutout = $ColorRectWithCutout
@onready var test_rect: ColorRect = $ColorRectWithCutout/TestRect

var current_cutout: Rect2:
	get:
		var mySize := size
		return Rect2(Vector2(0.5 * (mySize.x - view_width), top_bottom_margin),
			Vector2(view_width, mySize.y - 2.0 * top_bottom_margin))

func _ready():
	_on_item_rect_changed()
	if Engine.is_editor_hint():
		return
	else:
		test_rect.hide()

func _on_item_rect_changed():
	if not cutout_rect:
		return
	var mySize := size
	var cutout := current_cutout
	
	if Engine.is_editor_hint():
		test_rect.position = cutout.position
		test_rect.size = cutout.size
		return

	cutout_rect.cutout_top_left = cutout.position
	cutout_rect.cutout_size = cutout.size
	print("emitting window changed: ", cutout)
	window_changed.emit(cutout)
