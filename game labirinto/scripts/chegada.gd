extends Area2D

## lista de fases
var levels: Array[String] = [
	"res://levels/fase_1.tscn", # index 0
	"res://levels/fase_2.tscn", # index 1
	"res://levels/fase_3.tscn",  # index 2
	"res://levels/game_won.tscn" # index 3
]

# executa sempre que o PLayer chegar no ponto final:
func _on_body_entered(body):
	if body is Player:  # se o corpo que colidiu for o Player
		GlobalVar.levelAtual += 1  # incrementa o level
		if GlobalVar.levelAtual == 1: 
			# invoca a função para ir para a fase 2
			GlobalVar.next_scene(levels[GlobalVar.levelAtual]);
			# invoca a função para ir para a fase 3
		elif GlobalVar.levelAtual == 2:
			GlobalVar.next_scene(levels[GlobalVar.levelAtual]);
			# invoca a função para ir para a cena da Tela de ganhador
		elif GlobalVar.levelAtual == 3:
			GlobalVar.next_scene(levels[GlobalVar.levelAtual]);

