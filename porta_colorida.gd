extends Sprite2D

func open_door():
	frame = 1
	%DoorCollision.set_deferred("disabled",true)

func close_door():
	frame = 0
	%DoorCollision.set_deferred("disabled",false)
