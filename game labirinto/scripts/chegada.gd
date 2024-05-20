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
		GlobalVar.next_scene(levels[GlobalVar.levelAtual])

