extends Node2D

@export var blue_door : Sprite2D
@export var red_door1 : Sprite2D
@export var red_door2 : Sprite2D
@export var red_door3 : Sprite2D
@export var red_door4 : Sprite2D
@export var red_door5 : Sprite2D
@export var yellow_door1 : Sprite2D
@export var yellow_door2 : Sprite2D
@export var yellow_door3 : Sprite2D

func push_button(value):
	if blue_door.frame == 0:
		blue_door.open_door()
		red_door1.close_door()
		red_door2.close_door()
		red_door3.close_door()
		red_door4.close_door()
		red_door5.close_door()
		yellow_door1.open_door()
		yellow_door2.open_door()
		yellow_door3.open_door()
		
	else:
		blue_door.close_door()
		red_door1.open_door()
		red_door2.open_door()
		red_door3.open_door()
		red_door4.open_door()
		red_door5.open_door()
