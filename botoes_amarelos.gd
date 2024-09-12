extends Node2D

@export var yellow_door1 : Sprite2D
@export var yellow_door2 : Sprite2D
@export var yellow_door3 : Sprite2D
@export var blue_door : Sprite2D

func push_button(value):
	if yellow_door1.frame == 0:
		yellow_door1.open_door()
		yellow_door2.open_door()
		yellow_door3.open_door()
		blue_door.close_door()

	else:
		yellow_door1.close_door()
		yellow_door2.close_door()
		yellow_door3.close_door()
		blue_door.open_door()
