extends Area2D

var player_in_area = false

func _ready():
	$Label.visible = false  # Esconde o label de interação no início

func _on_Area2D_body_entered(body):
	if body.name == "Player":  # Verifica se o corpo que entrou é o jogador
		print ("a")
		player_in_area = true
		$Label.visible = true  # Mostra o label de interação

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		player_in_area = false
		$Label.visible = false  # Esconde o label de interação

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("ui_accept"):  # Verifica se a tecla "E" foi pressionada
		get_tree().change_scene("res://caminho/para/sua/nova_cena.tscn")  # Muda para a nova cena


func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
