extends Area2D

# time para adicionar a cada presente coletado
@export var time_to_add = 3

# executa sempre que o player colete um presente
func _on_body_entered(body):
	if body is Player: # verifica se quem encostou foi o Player
		GlobalVar.addTime(time_to_add); # adiciona 3 segundos no Time
		queue_free() # se auto apaga

