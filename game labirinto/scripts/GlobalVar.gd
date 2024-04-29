extends Node

# variável que controla quando o player pode se mover:
var player_move: bool = false

## var que aumenta a cada level:
var levelAtual = 0

# var que controla a inicialização da fase atual
var levelNode = null

## função para adiconar tempo:
func addTime(tempo:int) -> void:
	if levelNode == null:
		return
	var cronometro = levelNode.cronometro as Timer
	cronometro.start(cronometro.time_left + tempo);

## função para chamar a próxima cena:
func next_scene(scene:String) -> void:
	if levelNode == null:
		return
	get_tree().change_scene_to_file(scene)
	

