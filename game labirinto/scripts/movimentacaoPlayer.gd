extends CharacterBody2D

# define este script como uma classe Player
class_name Player 

# variáveis para controle de moviento
var direcao : Vector2 = Vector2.ZERO
var speed : float = 75.0

func _process(delta):
	# chamando a movimnentação:
	if GlobalVar.player_move: # verificando se há permissão para movimentar
		movimentacao()
		# mudando animação so personagem conforme seu movimentos:
		animacao_personagem()


## função sem retorno que faz com que o Player se movimente nas horizontais e verticais
func movimentacao():
	# movimentação nas horizontais:
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("mv_right"):
		$animacao.flip_h = false	# animação vira pra direita
		direcao.x = 1				# move para a direita
	elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("mv_left"):
		$animacao.flip_h = true		# animação vira pra direita
		direcao.x = -1				# move para a esquerda
	else:
		direcao.x = 0				# permanece parado
	
	# movimentação nas verticais:
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("mv_up"):
		direcao.y = -1				# move para cima
	elif Input.is_action_pressed("ui_down") or Input.is_action_pressed("mv_down"):
		direcao.y = 1				# move para baixo
	else:
		direcao.y = 0				# permanece parado
	
	velocity = direcao.normalized() * speed  # aplicando velocidade na direção
	move_and_slide()		# aplica o movimento de velocity
	
## função que aplica animação ao personagem conforme o movimento
func animacao_personagem():
	# mudando amimação do personagem caso esteja correndo:
	if direcao.x != 0:
		$animacao.play("Correndo");  # correndo
	elif direcao.y < 0:
		$animacao.play("subindo")  # subindo
	elif direcao.y > 0:
		$animacao.play("descendo")  # descendo
	else:
		$animacao.play("idle"); # parado
	
