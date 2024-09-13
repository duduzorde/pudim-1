extends CharacterBody2D

var velocidade = Vector2(0,0) #velocidade normal no plano cartesiano é zero
@export var frozen = false

const VELOCIDADE_MAX = 5
const ACELERACAO = 30
const ATRITO = 25
# aceleracao e atrito adicionam "fluidez" ao movimento

@onready var animacaoJogador = $AnimationPlayer
@onready var animacaoArvore = get_node("AnimationTree")
# declarando as variáveis que vao pegar as animacoes da animation tree

func _physics_process(delta):
	if frozen:
		return
	
	var resultante = Vector2(0,0)	
	resultante.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	resultante.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	# operação de subtração pra decidir a direção da resultante x e y (0, 1 ou -1)
	resultante = resultante.normalized()
	# faz com que a direcao, quando sobreposta (cima ou baixo com esquerda ou direita), nao fique mais rapido
	
	if resultante != Vector2(0,0): # se a resultante 
		animacaoArvore.set("parameters/Correndo/blend_position", resultante)
		animacaoArvore.set("parameters/Parado/blend_position", resultante)
		# pega as animações de correndo e parado da animation tree
		
		velocidade = velocidade.move_toward(resultante * VELOCIDADE_MAX, ACELERACAO * delta)
		# faz com que a velocidade va gradualmente em direcao a velocidade maxima baseado na aceleracao 
		# (quanto maior a aceleracao, mais rapido a velocidade chega na quantidade máxima)
		
		animacaoArvore.get("parameters/playback").travel("Correndo")
		# toca a animação de correndo baseado no botao que o jogador ta apertando
		
	else: 
		velocidade = velocidade.move_toward(Vector2.ZERO, ATRITO * delta)
		animacaoArvore.get("parameters/playback").travel("Parado")
		# toca a animacao de parado baseado na animacao de correndo que tava tocando antes 

	move_and_collide(velocidade)
