extends Node2D

@export_file("*.dtl") var timeline

@onready var player = get_node("Player")

func comecaDialogo(timeline: String):
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start(timeline)
	player.frozen = true
	get_viewport().set_input_as_handled()
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	comecaDialogo('timeline')
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	player.frozen = false
	# do something else here

func _on_area_2d_area_entered(area):
	comecaDialogo('timeline')
	pass # Replace with function body.
