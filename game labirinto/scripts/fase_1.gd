extends Node2D

# variável para acessar o Timer de Game
@onready var cronometro: Timer = $TimerGame

# variável para acessar o Timer de inicialização:
@onready var time_init: Timer = $TimerInit

# variável para acessar o label do time:
@onready var labelTime: Label = $label_time/Label

# variável para acessar o label da fase:
@onready var labelFase: Label = $label_fase/Label

# executa qunado a cena é iniciada
func _ready():
	GlobalVar.levelNode = self; # levelNode recebe a fase

# executa todo tempo durante o game, a cada frame
func _process(delta):
	
	# atualizar a exibição do time init:
	var time_to_init = int(time_init.time_left)
	if time_to_init > 0:  # enquanto estiver no time init
		GlobalVar.player_move = false  # jogador não pode movimentar
		labelTime.text = "Time to init: " + str(time_to_init) # label time init
		
		
	# atualizar a exibição do time Game:
	var tempo_restante = cronometro.time_left
	if tempo_restante > 0:
		labelTime.text = "Tempo: "+ str(int(tempo_restante));

# executa quando o time game esgotar
func _on_timer_timeout():
	labelTime.text = "Time Is Over!"
	# chama a scene de game over
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
	
# executa quando o time init esgota
func _on_timer_init_timeout():
	GlobalVar.player_move = true # PLayer pode se movimentar
	cronometro.start()			 # inicia o time Game
	labelFase.text = "corra!"	 # altera o label Fase

