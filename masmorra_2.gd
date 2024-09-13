extends Node2D

@export_file("*.dtl") var timeline

func comecaDialogo(timeline: String):
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start(timeline)
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	comecaDialogo('timeline2')
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	# do something else here

func _on_area_2d_area_entered(area):
	comecaDialogo('timeline3')
	pass # Replace with function body.
