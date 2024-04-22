class_name ColorRectWithCutout
extends ColorRect

@export var cutout_top_left: Vector2 = Vector2(10, 10):
	set(newValue):
		if cutout_top_left == newValue:
			return
		cutout_top_left = newValue
		if material:
			material.set_shader_parameter("hole_position", cutout_top_left)
@export var cutout_size: Vector2 = Vector2(100, 100):
	set(newValue):
		if cutout_size == newValue:
			return
		cutout_size = newValue
		if material:
			material.set_shader_parameter("hole_size", cutout_size)

func _ready():
	material.set_shader_parameter("hole_position", cutout_top_left)
	material.set_shader_parameter("hole_size", cutout_size)
