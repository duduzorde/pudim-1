extends Node2D

@export_file("*.dtl") var timeline

var ativouDialogo = false

# Called when the node enters the scene tree for the first time.
func _ready():
	comecaDialogo('timeline4')
	pass # Replace with function body.
	
func comecaDialogo(timeline: String):
	if ativouDialogo:
		return
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start(timeline)
	ativouDialogo = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	get_tree().change_scene_to_file("res://endgame.tscn")
	# do something else here

func _on_area_2d_area_entered(area):
	comecaDialogo('timeline3')
	pass # Replace with function body.
