extends Area2D

var player_in_area = false

func _ready():
	$Label.visible = false  # Esconde o label de interação no início
	
func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interagir"):  # Verifica se a tecla "E" foi pressionada
		get_tree().change_scene_to_file("res://puzzle_bau.tscn")  # Muda para a nova cena


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # Verifica se o corpo que entrou é o jogador
		player_in_area = true
		$Label.visible = true  # Mostra o label de interação


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
		$Label.visible = false  # Esconde o label de interação
