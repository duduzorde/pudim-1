extends Node2D

@export var door : Sprite2D

func push_button(value):
	if door.frame == 0:
		door.open_door()
	else:
		door.close_door()
