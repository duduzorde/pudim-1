extends Sprite2D

func pressed():
	frame = 2

func unpressed():
	frame = 1

func _on_player_entered(body: Node2D) -> void:
	pressed()

func _on_player_exited(body: Node2D) -> void:
	unpressed()
