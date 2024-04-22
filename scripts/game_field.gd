class_name GameField
extends Node2D

@onready var game_objs: Node2D = $GameObjects
@onready var bottom_right: Node2D = %BottomRight
@onready var chr: Character = %Character
@onready var border: BulletBorder = %BulletBorder
@onready var hud: MainWindow = %HUD
@onready var stats_label: Label = %StatsLabel

func _ready():
	set_field_size(hud.current_cutout)

func _process(_delta):
	stats_label.text = "FPS: {0}
		Process time: {1}
		Node count: {2}
		Object count: {3}".format([Performance.get_monitor(Performance.TIME_FPS), 
		Performance.get_monitor(Performance.TIME_PROCESS),
		Performance.get_monitor(Performance.OBJECT_NODE_COUNT),
		Performance.get_monitor(Performance.OBJECT_COUNT)])

func set_field_size(new_size: Rect2):
	if not bottom_right: return
	game_objs.position = new_size.position
	# add some vector to have a bit of a buffer
	bottom_right.position = new_size.size + Vector2(10.0, 10.0)
	#print("border is ", $BulletBorder/TopLeft.position, " to ", bottom_right.position)
	chr.available_space = Rect2(Vector2.ZERO, new_size.size).grow(-10.0)
	border.update_boundary_rect()
