extends Area2D

var player_in_area = false

func _ready():
	$Label.visible = false  # Esconde o label de interação no início
	$Sprite2D2.visible = true

	
func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interagir"):  # Verifica se a tecla "E" foi pressionada
		$Sprite2D2.visible = false
		$Label.visible = false


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # Verifica se o corpo que entrou é o jogador
		player_in_area = true
		$Label.visible = true  # Mostra o label de interação


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
		$Label.visible = false  # Esconde o label de interação
